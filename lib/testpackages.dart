

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


/// هذا الملف منن اجل تجريب الباكيجات قبل استخدامها يا ميررررررناااااااا  :)
class TestPackages extends StatelessWidget {
  const TestPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test "),
      ),
      body: Center(child: ListView(
        children: [
            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
           
        }, // end onSubmit
    ),

        ],
      ),),
    );
  }
}