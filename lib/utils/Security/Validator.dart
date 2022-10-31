class Validator {
  bool isSecurityValid(value) {
    // TODO Реализовать метод
    return true;
  }

  static isEmptyValid(String value) {
    if (value.isEmpty) return 'Пожалуста, введите данные';
    return null;
  }

  static isEmailValid(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (!emailValid) return 'Введите корректный email';
    return null;
  }

  static isPasswordValid(String? value) {
    if (value!.length < 8) return 'Пароль должен содержать минимум 8 символов';
    // TODO Реализовать метод
    return null;
  }

  static isPhoneValid(String? value) {
    if (value!.length < 11 || value!.length > 11)
      return 'Введите корректный номер телефона';

    if (value.substring(0, 2) != '89') return 'Некорректный формат';
    // TODO Реализовать метод
    return null;
  }
}
