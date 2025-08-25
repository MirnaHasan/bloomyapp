

import 'package:flutter/material.dart';

class CardPaymentCheckOutMethod extends StatelessWidget {
  final String title ; 
  final isActive ; 
  const CardPaymentCheckOutMethod({super.key, required this.title,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isActive == true ? 
                 const Color.fromARGB(255, 202, 238, 130): const Color.fromARGB(255, 163, 193, 131),
                // color: AppColor.greenAccent
              ),

              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

              child: Text(
                title,
                style: TextStyle(
                 
                  
                  color:isActive == true ?  Colors.deepOrange : const Color.fromARGB(255, 249, 247, 247),

                  fontSize: 18,
                ),
              ),
            );

  }
}
