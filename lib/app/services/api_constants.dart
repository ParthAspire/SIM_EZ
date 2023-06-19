class ApiConst {
  static String baseUrl = 'http://174.138.21.74:5562/';

  static String client = 'client';

  static String auth = '$client/auth';
  static String profile = '$client/profile';

  static String normalLogin = '$auth/normalLogin';
  static String socialLogin = '$auth/socialLogin';
  static String sendOtp = '$auth/sendOtp';
  static String otpVerify = '$auth/otpVerify';
  static String forgetPassOtp = '$auth/forgetPassOtp';
  static String forgotOtpVerify = '$auth/forgotOtpVerify';
  static String saveForgetPassword = '$auth/saveForgetPassword';
  static String changePassword = '$profile/changePassword';
}
