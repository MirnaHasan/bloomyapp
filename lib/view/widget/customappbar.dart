

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar ; 

  final  void Function()? onPressedSearch ;
  final  void Function()? onPressedIconFavorite;
 final void Function(String)? onChanged ; 
  final TextEditingController? mycontroller ;
  const CustomAppBar({super.key, required this.titleAppBar, 

  
  required this.onPressedSearch,required this.onPressedIconFavorite,required this.onChanged,required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.only(top: 10),
             
              child: Row(children: [
              Expanded(child: TextFormField(
                onChanged: onChanged,
                controller:mycontroller ,
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
            //   SizedBox(width: 10 ) ,
            //     Container(  decoration: BoxDecoration(    
            //       borderRadius:    BorderRadius.circular(10 ),
            //        color: Colors.grey[200],) ,
            //       width: 60 ,
               
            //       padding: EdgeInsets.symmetric(vertical: 4) , 
            //       child: IconButton(onPressed: onPressedIcon, 
            // icon: Icon(Icons.notifications_active_outlined , size: 30  , color: Colors.grey[600] , )
            
            
            // ),),
              SizedBox(width: 10 ) ,
                Container(  decoration: BoxDecoration(    
                  borderRadius:    BorderRadius.circular(10 ),
                   color: Colors.grey[200],) ,
                  width: 60 ,
               
                  padding: EdgeInsets.symmetric(vertical: 4) , 
                  child: IconButton(onPressed: onPressedIconFavorite, 
            icon: Icon(Icons.favorite_border_outlined , size: 30  , color: Colors.grey[600] , )
            
            
            ),),
            ],),);
  }
}