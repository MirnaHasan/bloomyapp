

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar ; 
  final  void Function()? onPressedIcon ;
  final  void Function()? onPressedSearch ;

  
  const CustomAppBar({super.key, required this.titleAppBar, required this.onPressedIcon,required this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.only(top: 10),
             
              child: Row(children: [
              Expanded(child: TextFormField(
                
              decoration: InputDecoration(
                prefixIcon: IconButton(onPressed: onPressedSearch, icon: Icon(Icons.search) ),
                hintText:titleAppBar , hintStyle:  TextStyle( fontSize: 18 ) ,
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                 borderSide: BorderSide.none,
                 borderRadius: BorderRadius.circular(20) ,
                
                )
              )

              )) ,
              SizedBox(width: 10 ) ,
                Container(  decoration: BoxDecoration(    
                  borderRadius:    BorderRadius.circular(10 ),
                   color: Colors.grey[200],) ,
                  width: 60 ,
               
                  padding: EdgeInsets.symmetric(vertical: 4) , 
                  child: IconButton(onPressed: onPressedIcon, 
            icon: Icon(Icons.notifications_active_outlined , size: 30  , color: Colors.grey[600] , )
            
            
            ),),
            ],),);
  }
}