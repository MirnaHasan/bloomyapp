import 'package:bloomy/controller/checkout_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/view/widget/checkout/carddeliverytype.dart';
import 'package:bloomy/view/widget/checkout/cardpaymentcheckoutmethod.dart';
import 'package:bloomy/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController()) ;
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
      body: GetBuilder<CheckOutController>(builder: (controller) =>
      HandlingDataView(statusRequest: controller.statusRequest, widget:  Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              textAlign: TextAlign.center,
              "Choose a Payment Method,Please",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                controller.chossePaymentMethod("cash") ;
              },
              child: CardPaymentCheckOutMethod(
                title: "Cash On Delivery",
                isActive: controller.paymentMethod == 'cash' ? true : false,
              ),
            ),
            InkWell(
              onTap: (){
                  controller.chossePaymentMethod("card") ;
              },
              child: CardPaymentCheckOutMethod(
              title: "Payment Card", 
              isActive: controller.paymentMethod == 'card' ? true : false)),

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
                InkWell(
                   onTap: (){
                    controller.chossedeliveryType('delivery') ;
                   },
                  child: CardDeliveryType(
                    imageName: AppImage.delivery,
                    isActive: controller.deliveryType == 'delivery' ? true : false,
                    title: "Delivery",
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: (){
                    controller.chossedeliveryType('drivethru') ;
                  },
                  child: CardDeliveryType(
                    imageName: AppImage.deliverythru,
                    isActive: controller.deliveryType == 'drivethru' ? true : false,
                    title: "Drive Thru",
                  ),
                ),
              ],
            ),
            if (controller.deliveryType == 'delivery') Column(
            children: [
               SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Shipping Address",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),

            ListView.builder(
                shrinkWrap: true, // يجعل الليست تبني على حسب حجم العناصر فقط
  physics: NeverScrollableScrollPhysics(), 
              itemCount: controller.data.length,
              itemBuilder: (context , index)=>
              
               InkWell(
              onTap: (){
                controller.chosseShippingAddress(controller.data[index].addressId.toString()) ; 
              },
              child: CardShippingAddress(
                title: controller.data[index].addressName.toString(),

                subtitle:
                "${controller.data[index].addressCity.toString()}${controller.data[index].addressStreet.toString()}"  ,  
                isActive: controller.addressId == controller.data[index].addressId.toString()  ? true : false

              ),
            ),
              )
           
           
            ],
           )  ]  , 
        ),
      ),)
      )
    );
  }
}
