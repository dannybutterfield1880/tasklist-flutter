import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  @observable
  bool isDarkMode = false;

  @action
  void toggleIsDarkMode() {
    isDarkMode = !isDarkMode;
  }
}