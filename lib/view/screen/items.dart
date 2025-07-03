

import 'package:bloomy/view/widget/customappbar.dart';
import 'package:bloomy/view/widget/home/listcategorieshome.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
         CustomAppBar(titleAppBar: "Find Products",
          onPressedIcon: (){}, onPressedSearch: (){}) ,
          ListCategoriesHome() , 
          
          ],
        ),
      ),
    );
  }
}