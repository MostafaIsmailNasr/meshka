import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import '../../../../../business/cartController/CartController.dart';
import '../../../../../business/more/addressController/AddressController.dart';
import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/cartModel/cartListModel/CartListResponse.dart';

class DeleteScreen extends StatefulWidget{
   int? id;
   var tittle, des ,from;
   CartItems? cartItems;

   DeleteScreen({this.id, this.tittle, this.des, this.from,this.cartItems});

  @override
  State<StatefulWidget> createState() {
    return _DeleteScreen();
  }
}

class _DeleteScreen extends State<DeleteScreen>{
  final addressController = Get.put(AddressController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset('assets/delete2.svg',width: 100,height: 100,),
          ),
           SizedBox(height: 1.h,),
          Text(widget.tittle,
            style: TextStyle(fontSize: 14.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark1),
            textAlign: TextAlign.center,),
           SizedBox(height: 1.h,),
          Text(widget.des,
            style: TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark3),
            textAlign: TextAlign.center,),
           SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DialogButton(
                  radius: BorderRadius.circular(5),
                  height: 7.h,
                  onPressed: () => {
                    if(widget.from=="address"){
                      addressController.deleteAddress(widget.id!, context)
                    }else if(widget.from=="allCart"){
                      cartController.deleteCart(cartController.cartId.value,context)
                    }else if(widget.from=="itemCart"){
                        cartController
                            .deleteCartItem(
                                widget.cartItems!.cartItemId!.toString(),
                                widget.cartItems!.productId!.toString(),
                                widget.cartItems!.cartId!.toString())
                            .then((_) {
                          if (cartController.updateCartResponse.value.success ==
                              true) {
                            cartController
                                .getCart(widget.cartItems!.cartId!.toString());
                          }
                        }),
                      Navigator.pop(context)
                    }else if(widget.from=="itemCartMine"){
                        cartController.deleteCartItem(
                          widget.cartItems!.cartItemId!.toString(),
                          widget.cartItems!.productId!.toString(),
                          widget.cartItems!.cartId!.toString()).then((_){
                          if(cartController.updateCartResponse.value.success==true){
                            cartController.isVisable.value=false;
                            cartController.getCart(widget.cartItems!.cartId!.toString());
                          }
                        }),
                      Navigator.pop(context)
                    }
                  },
                  color: MyColors.STATUSEREDColor,
                  child: Text('delete'.tr(), style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'heavy',
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
                ),
              ),
              Expanded(
                  child: DialogButton(
                    height: 7.h,
                    radius: BorderRadius.circular(5),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: MyColors.MainColor,
                    child: Text('cancel'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),

                  )
              )
            ],
          )
        ],
      ),
    );
  }

}