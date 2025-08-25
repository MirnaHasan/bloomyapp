
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: Container(
           padding: EdgeInsets.all(20),
        child: ListView(
          children: [
          Text( textAlign: TextAlign.center , 
            "Choose a Payment Method,Please" , 
          style:  Theme.of(context).textTheme.bodyMedium , 
          
           ) , 
           SizedBox(height: 10,) , 
           Container(
             alignment: Alignment.center,
            padding: EdgeInsets.symmetric( vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25) , 
                 color: const Color.fromARGB(255, 202, 238, 130),
              // color: AppColor.greenAccent
            ),
          
            margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
           
              child: Text("Cash" , style: TextStyle(
                // color: const Color.fromARGB(255, 72, 70, 70) , 
                color: Colors.deepOrange , 
            
                fontSize: 18
              ))),
           
       
          Container(
            
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric( vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25) , 
              color: const Color.fromARGB(255, 163, 193, 131)
            ),
          
            margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
           
              child: Text("Payment Card" , style: TextStyle(
                    color: const Color.fromARGB(255, 249, 247, 247) , 
                fontSize: 18
              ))),
              SizedBox(height: 10,) , 
              Text( textAlign: TextAlign.center , 
            "Choose a Delivery Method ,Please" , 
          style:  Theme.of(context).textTheme.bodyMedium , 
          
           ) , 
           SizedBox(height: 10,) , 
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 202, 238, 130),
                          border: Border.all(
                            color: AppColor.green , 
                            width: 2
                          )) , 
                        
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
               
                        
                       Image.asset(AppImage.delivery , width: 60, 
                             
                           ),
                           Text("Delivery" , style: TextStyle(
                            color: Colors.deepOrange
                           ),) , 
                    
                    
                    ],)
                  ),
                  SizedBox(width: 20,) , 
                   Container(
                  height: 130,
                        width: 140,
                        decoration: BoxDecoration(
                          // color: Colors.orange,
                          border: Border.all(
                            color: AppColor.green , 
                            width: 2
                          )) , 
                        
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Image.asset(AppImage.deliverythru , width: 60,),
                      Text("Drive Thru") , 
                        
                   
                  
                    
                    
                    ],)
                  ),

           ] ) , 
              
          ],
        ),
      ),
    );
  }
}