import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ApplicationBlocObserver extends BlocObserver {
  @override
  void noSuchMethod(Invocation invocation) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Such method: $invocation.',
      );
    }

    super.noSuchMethod(
      invocation,
    );
  }

  @override
  void onChange(
    BlocBase bloc,
    Change change,
  ) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Change: $change.',
      );
    }

    super.onChange(
      bloc,
      change,
    );
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Close: $bloc.',
      );
    }

    super.onClose(
      bloc,
    );
  }

  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Create: $bloc.',
      );
    }

    super.onCreate(
      bloc,
    );
  }

  @override
  void onEvent(
    Bloc bloc,
    Object? event,
  ) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Event: $event.',
      );
    }

    super.onEvent(
      bloc,
      event,
    );
  }

  @override
  void onTransition(
    Bloc bloc,
    Transition transition,
  ) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Transition: $transition.',
      );
    }

    super.onTransition(
      bloc,
      transition,
    );
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    if (kDebugMode) {
      print(
        'ApplicationBlocObserver. Error: $error.',
      );
    }

    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }
}
