import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/view/widget/checkout/carddeliverytype.dart';
import 'package:bloomy/view/widget/checkout/cardpaymentcheckoutmethod.dart';
import 'package:bloomy/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CheckOut")),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.greenAccent,
          textColor: Colors.white,
          onPressed: () {},
          child: Text("CheckOut", style: TextStyle(fontSize: 20)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              textAlign: TextAlign.center,
              "Choose a Payment Method,Please",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            CardPaymentCheckOutMethod(
              title: "Cash On Delivery",
              isActive: true,
            ),
            CardPaymentCheckOutMethod(title: "Payment Card", isActive: false),

            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              "Choose a Delivery Method ,Please",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardDeliveryType(
                  imageName: AppImage.delivery,
                  isActive: true,
                  title: "Delivery",
                ),
                SizedBox(width: 20),
                CardDeliveryType(
                  imageName: AppImage.deliverythru,
                  isActive: false,
                  title: "Drive Thru",
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Shipping Address",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),

            CardShippingAddress(
              title: "Home",
              subtitle: "streeet23 ",
              isActive: true,
            ),
            CardShippingAddress(
              title: "Company",
              subtitle: "latakiaaaaaaa",
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
