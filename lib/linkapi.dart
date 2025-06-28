

class linkApi {
  static const  String linkServer = "http://10.0.2.2/bloomy";
  static const String linkTest = "$linkServer/test.php";
  //Auth///==================================================
  static const String linkSignUp = "$linkServer/auth/signup.php";
  static const String linkVerfiyCodesignup = "$linkServer/auth/verfiycode.php";
  //Home==============================================
  static const String linkLogIn = "$linkServer/auth/login.php";
  ///ForgetPassword===============================================================
 static const String resetpasswordLink = "$linkServer/forgetpassword/resetpassword.php";
 static const String checkemailLink = "$linkServer/forgetpassword/checkemail.php";
  static const String verifycodeforgetpasswordLink = "$linkServer/forgetpassword/verifycode.php";
  //==========================================home===========================================
    static const String homeLink = "$linkServer/home.php";

}