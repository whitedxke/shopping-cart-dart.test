import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network.dart';
import 'core/repositories/base_repository.dart';
import 'core/repositories/products/products_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.I;

  // Configure the network, and repositories.
  await _configureNetwork(
    getIt: getIt,
  );
  final repositories = await _configureRepositories(
    getIt: getIt,
  );

  // Initializing repository dependencies.
  for (var repository in repositories) {
    await repository.initialDependencies();
  }

  // Для тестирования.
  final productsRepository = getIt.get<ProductsRepository>();
  try {
    final products = await productsRepository.getProducts();
    print('LOLYOU: $products.');
  } catch (error) {
    print('Ошибка при получении продуктов: $error.');
  }

  runApp(
    const Application(),
  );
}

Future<void> _configureNetwork({
  required GetIt getIt,
}) async {
  final network = await Network.create();
  getIt.registerSingleton(
    network,
  );
  network.registrationApiSingletons();
}

Future<List<BaseRepository>> _configureRepositories({
  required GetIt getIt,
}) async {
  final List<BaseRepository> repositories = List.empty(
    growable: true,
  );
  repositories.add(
    ProductsRepository(),
  );

  // Repository Registration.
  for (var repository in repositories) {
    repository.registration(
      getIt: getIt,
    );
  }

  return repositories;
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
