import 'package:flutter/material.dart';
import 'package:get/get.dart';



void showSnackbar({
    required String title,
    required String message,
    IconData icon = Icons.eco,
  }) {
    Get.snackbar(
      "", "",
      titleText: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 6, 50, 9))),
      messageText: Text(message,
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 6, 50, 9))),
      snackPosition: SnackPosition.TOP,
      backgroundGradient: const LinearGradient(
          colors: [Color(0xFFDFFFD6), Color(0xFFB5EAD7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      icon: Icon(icon, color: const Color.fromARGB(255, 6, 50, 9), size: 30),
      shouldIconPulse: true,
      duration: const Duration(seconds: 3),
      barBlur: 15,
      overlayBlur: 1,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
