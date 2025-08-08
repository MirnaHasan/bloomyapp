

class linkApi {

   static const  String linkServer = "http://10.0.2.2/bloomy";
   
    // ==============images==========================================

  
  static const String linkimages = "$linkServer/upload";
  //  static const String linkcategoriesimages = "$linkimages/categories";
  //  static const String linkitemsimages = "$linkimages/items";

 


  //==============================================
  static const String linkTest = "$linkServer/test.php";
  //Auth///==================================================
  static const String linkSignUp = "$linkServer/auth/signup.php";
  static const String linkVerfiyCodesignup = "$linkServer/auth/verfiycode.php";
    static const String linkresendverfiycode = "$linkServer/auth/resendverfiycode.php" ;
  //Home==============================================
  static const String linkLogIn = "$linkServer/auth/login.php";
  ///ForgetPassword===============================================================
 static const String resetpasswordLink = "$linkServer/forgetpassword/resetpassword.php";
 static const String checkemailLink = "$linkServer/forgetpassword/checkemail.php";
  static const String verifycodeforgetpasswordLink = "$linkServer/forgetpassword/verifycode.php";
  //==========================================home===========================================
    static const String homeLink = "$linkServer/home.php";
    //===============================linkitems=============================
     static const String linkitems = "$linkServer/items/items.php";
     //=====================favorite============================================
      static const String linkaddfavorite = "$linkServer/favorite/add.php";
      static const String linkremovefavorite = "$linkServer/favorite/remove.php";
      static const String linkviewfavorite = "$linkServer/favorite/viewmyfavorite.php";
      static const String linkdeletfromfavorite = "$linkServer/favorite/deletfromfavorite.php";
      //======================cart================================================
      
      static const String linkviewcart = "$linkServer/cart/viewcart.php";


      static const String linkdeletfromcart = "$linkServer/cart/deletfromcart.php";
      
      static const String linkaddtocart = "$linkServer/cart/addtocart.php";
        
}