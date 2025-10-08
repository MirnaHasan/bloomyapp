

 import 'package:bloomy/controller/orders/orderarchivecontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rating_dialog/rating_dialog.dart';

final _dialog = RatingDialog(
  initialRating: 1.0,
  // your app's name?
  title: Text(
    'Rating Dialog',
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  ),
  // encourage your user to leave a high rating?
  message: Text(
    'Tap a star to set your rating. Add more description here if you want.',
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 15),
  ),
  // your app's logo?
  image: Image.asset(AppImage.logoImage , width: 200,height: 200,) , 
  submitButtonText: 'Submit',
  submitButtonTextStyle: TextStyle(
    color: AppColor.green , fontWeight: FontWeight.bold
  ),
  commentHint: 'Set your custom comment hint',
  onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    OrdersArchiveController controller = Get.find() ;
    print('rating: ${response.rating}, comment: ${response.comment}');
  },
);

void showDialogRating(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => _dialog,
  );
}
