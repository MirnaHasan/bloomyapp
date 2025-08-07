

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Price :" , style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("1200\$" ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("shapping:" , style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("1200\$" ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black,)) ,
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("The Total Price :" , style: TextStyle(
                  color: AppColor.green,
                   fontFamily: 'sans' ,
                  
                ),),
              ) , 
              Container(  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("1200\$" ,  style: TextStyle(
                  color: AppColor.green,
                 
                   fontFamily: 'sans' ,
                ),),
              ) , 
              
            ],) , 
             SizedBox(height: 20,) ,
            CustomButtonCart(textButton: "Place Order", onPressed: (){}) , 
           
          ],
        ),
      ),
      body: ListView(
        
        children: [
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                 
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)))), 
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("My Cart" , style: TextStyle(
                      fontSize: 25 , 
                      fontWeight: FontWeight.normal
                     
                    ),),
                  ),
                ),
                Spacer()
                 
              ],
            )) ,
            SizedBox(height: 10,) ,
            Container(
              padding: EdgeInsets.only(bottom: 5),
              margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 20 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20) , 
              color: AppColor.greenAccent

            ),
            child: Text("You Have 3 Items In Your List " , 
            
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal
              // fontFamily: 'sans'
            ),
            textAlign: TextAlign.center),) ,
            Container(
            padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(AppImage.logoImage ,fit: BoxFit.cover,)) ,
                            Expanded(
                              flex: 3,
                              child: ListTile(
                              title: Text("gardenia flowers",style:  TextStyle(fontSize: 15 ) ) , 
                              subtitle: Text("200 \$" , style:  TextStyle(fontSize: 18, color: AppColor.green ))
                            )) ,
                              Expanded(child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    child: IconButton(onPressed: (){}, icon: Icon(Icons.add))) , 
                                  Container(
                                    height: 30,
                                    child: Text("2" , style: TextStyle(
                                      fontFamily: 'sans' ,
                                    ),)) ,
                                      Container(
                                        height: 25,
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.remove))) ,  
                                ],
                              )) ,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,) ,
                   Card(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(AppImage.onBoardingImageOne,fit: BoxFit.cover,)) ,
                            Expanded(
                              flex: 3,
                              child: ListTile(
                              title: Text("gardenia flowers",style:  TextStyle(fontSize: 15 ) ) , 
                              subtitle: Text("200 \$" , style:  TextStyle(fontSize: 18, color: AppColor.green ))
                            )) ,
                              Expanded(child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    child: IconButton(onPressed: (){}, icon: Icon(Icons.add))) , 
                                  Container(
                                    height: 30,
                                    child: Text("2" , style: TextStyle(
                                      fontFamily: 'sans' ,
                                    ),)) ,
                                      Container(
                                        height: 25,
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.remove))) ,  
                                ],
                              )) ,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],),
    );
  }
}