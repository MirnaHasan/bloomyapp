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
    CheckOutController controller =Get.put(CheckOutController()) ;
    return Scaffold(
      appBar: AppBar(title: Text("CheckOut")),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.greenAccent,
          textColor: Colors.white,
          onPressed: () {
            controller.checkOut() ; 
          },
          child: Text("CheckOut", style: TextStyle(fontSize: 20)),
        ),
      ),
      body: GetBuilder<CheckOutController>(builder: (controller) =>
      HandlingDataView(
           isCartPage: true,
        statusRequest: controller.statusRequest, widget:  Container(
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
                controller.chossePaymentMethod("0") ; //0=>cash 
              },
              child: CardPaymentCheckOutMethod(
                title: "Cash On Delivery",
                isActive: controller.paymentMethod == '0' ? true : false,
              ),
            ),
            InkWell(
              onTap: (){
                  controller.chossePaymentMethod("1") ; //1=> paymentcard
              },
              child: CardPaymentCheckOutMethod(
              title: "Payment Card", 
              isActive: controller.paymentMethod == '1' ? true : false)),

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
                    controller.chossedeliveryType('0') ; //0 => delivery
                   },
                  child: CardDeliveryType(
                    imageName: AppImage.delivery,
                    isActive: controller.deliveryType == '0' ? true : false,
                    title: "Delivery",
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: (){
                    controller.chossedeliveryType('1') ; // 1 => drivethru
                  },
                  child: CardDeliveryType(
                    imageName: AppImage.deliverythru,
                    isActive: controller.deliveryType == '1' ? true : false,
                    title: "Drive Thru",
                  ),
                ),
              ],
            ),
            if (controller.deliveryType == '0') Column(
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
