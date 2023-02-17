class Login {
  String username = 'admin';
  String password = '123';

  bool isLogin(String enteredName, String enteredPassword) {
    if (username != enteredName || password != enteredPassword) {
      return false;
    } else {
      return true;
    }
  }
}
