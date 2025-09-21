class ApiEndPoints {
  // BASE
  static const String baseUrl = "https://0650a86f4852.ngrok-free.app";

  // AUTH
  static const String login = 'api/auth/login';
  static const String register = 'api/auth/register';
  static const String verifyMail = 'api/auth/verify-email';
  static const String resendOtp = 'api/auth/resend-verification-email';

  //HOME
  static const String loadUser = 'api/auth/me';
}
