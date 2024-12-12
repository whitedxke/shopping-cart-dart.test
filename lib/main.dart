import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network.dart';
import 'core/repositories/base_repository.dart';
import 'core/repositories/products/products_repository.dart';
import 'observer.dart';
import 'ui/products/bloc/products_bloc.dart';
import 'ui/products/products_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ApplicationBlocObserver();
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

  // Repository registration.
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
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      designSize: const Size(
        375,
        812,
      ),
      fontSizeResolver: FontSizeResolvers.height,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc()..add(GetProducts()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsScreen(),
        ),
      ),
    );
  }
}
