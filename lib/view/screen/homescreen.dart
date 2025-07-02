

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 223, 170, 188),
        onPressed: (){} , child: Icon(Icons.shopping_basket_outlined
      
      ),
     
      ),
    
      bottomNavigationBar: BottomAppBar(
       
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Row(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ]),
                ),
                  MaterialButton(
                  onPressed: () {},
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ]),
                ),
              ],
            ),
            Spacer() , 
              Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ]),
                ),
                  MaterialButton(
                  onPressed: () {},
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.home),
                    Text("Home"),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(child: Text("Home screen"),),
    );
  }
}