import 'package:get_it/get_it.dart';

abstract class BaseRepository {
  Future<void> initialDependencies();

  void registration({
    required GetIt getIt,
  });
}
