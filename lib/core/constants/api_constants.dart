abstract class ApiConstants {
  static const String baseUrl = 'https://ecommerce.routemisr.com/';
  static const String apiVersion = 'api/v1/';

  // Auth
  static const String signupEndPoint = '${apiVersion}auth/signup';
  static const String signinEndPoint = '${apiVersion}auth/signin';
  static const String forgetPasswordEndPoint = '${apiVersion}auth/forgotPasswords';
  static const String verifyResetCodeEndPoint = '${apiVersion}auth/verifyResetCode';
  static const String updatePasswordEndPoint = '${apiVersion}auth/changeMyPassword';
  static const String resetPasswordEndPoint = '${apiVersion}auth/resetPassword';

}
