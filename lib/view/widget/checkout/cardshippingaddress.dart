

import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
  final String title ; 
  final String subtitle ; 
  final bool isActive ; 
  const CardShippingAddress({super.key, required this.title, required this.subtitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
              color: isActive == true ? 
              const Color.fromARGB(255, 202, 238, 130) : const Color.fromARGB(255, 163, 193, 131),
              // color: const Color.fromARGB(255, 218, 213, 213),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: isActive == true ? 
                   Colors.deepOrange: const Color.fromARGB(255, 249, 247, 247), ),
                ),
                subtitle: Text(
                 subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: isActive == true ? 
                   Colors.deepOrange: const Color.fromARGB(255, 249, 247, 247), ),
                 
                ),
              ),
            );
  }
}