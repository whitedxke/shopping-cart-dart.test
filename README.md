# Приложение.

Мобильное Flutter-приложение для просмотра товаров, и добавления их в корзину.

## Инструкция, как заупустить.

#### Требования.

Для того чтобы запустить проект, необходимо установить:
- [Скачать, и установить Flutter SDK](https://docs.flutter.dev/get-started/install);
- [Скачать, и установить Dart SDK](https://dart.dev/get-dart);
- [Android Studio или же, другой предпочитаемый редактор](https://developer.android.com/studio?hl=en).

Возможно, если вы используете MacOS, то - вам может помочь данная статья:
- [Installing the Flutter SDK on MacOS](https://www.codecademy.com/article/install-flutter-sdk-for-mac).

#### Установка.

Склонируйте данный репозиторий:
```
gh repo clone whitedxke/shopping-cart-dart.test
```

Перейдите в директорию проекта:
```
cd shopping-cart-dart.test
```

Установите необходимые зависимости:
```
flutter pub get
flutter pub upgrade
```

Запустите приложение:
```
flutter run
```

Если возникнут ошибки или проблемы, проверить их с помощью команды:
```
flutter doctor
```

## Используемые технологии.

- Язык программирования: Dart — основной язык для разработки на Flutter;
- Фреймворк: Flutter — для создания кросс-платформенных мобильных приложений;
- Пакеты:
  - [http](https://pub.dev/packages/http/install) — для асинхронных HTTP-запросов;
  - [bloc](https://bloclibrary.dev/getting-started/) — для управления состоянием приложения;
  - [get_it](https://pub.dev/packages/get_it/install) — для внедрения зависимостей;
  - [shared_preferences](https://pub.dev/packages/shared_preferences/install) — для хранения данных локально.
