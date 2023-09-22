class API {
  static const hostConnect = "http://192.168.1.6/clothes_app";
  static const hostConnectUser = "$hostConnect/user";

  // user api
  static const validateEmail = "$hostConnectUser/validate_email.php";
  static const signUp = "$hostConnectUser/signup.php";
  static const login = "$hostConnectUser/login.php";
}
