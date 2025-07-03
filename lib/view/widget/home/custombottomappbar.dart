

import 'package:flutter/material.dart';


class CustomBottomAppBar extends StatelessWidget {
final String textbutton ; 
final IconData  iconData ;
final  void Function()? onPressed ;
final Color? coloritemselected ;
 const CustomBottomAppBar(
 this.textbutton,
  this.iconData , 
 this.onPressed,
  this.coloritemselected,
   {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                  onPressed: onPressed ,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon( iconData,color: coloritemselected ) ,
                    Text(textbutton ) ,
                  ]),
                );
  }
}