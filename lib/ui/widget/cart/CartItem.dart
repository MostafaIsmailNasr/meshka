import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../business/cartController/CartController.dart';
import '../../../conustant/my_colors.dart';
import '../../../data/model/cartModel/cartListModel/CartListResponse.dart';
import '../../screens/createOrder/buttomSheets/deleteSheet/delet_sheet.dart';

class CartItem extends StatefulWidget{
  CartItems? cartItems;

  CartItem({required this.cartItems});

  @override
  State<StatefulWidget> createState() {
    return _CartItem();
  }
}

class _CartItem extends State<CartItem>{
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 1.h),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 22.w,
                height: 13.h,
                decoration: widget.cartItems?.image?.original != null
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.cartItems?.image?.original ?? "",
                            ),
                            fit: BoxFit.fill))
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage("assets/logo.app.png"),
                            fit: BoxFit.fill)),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (BuildContext context) => Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: DeleteScreen(id: null,
                                tittle: 'delete_cart_item'.tr(),
                                des: 'are_you_sure_you_want_to_delete_item'.tr(),
                                from: "itemCart",cartItems: widget.cartItems,)));

                    //cartController.deleteCartItem("","","");
                  },
                  child: Center(
                      child: SvgPicture.asset('assets/close2.svg')
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 1.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 25.h,
                child: Text(widget.cartItems?.name??"", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ),
              Row(
                children: [
                  Text("book_price2".tr(), style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                  widget.cartItems?.price.toString()!="null"?
                  Text( widget.cartItems?.price.toString()!="null"?"${widget.cartItems?.price.toString()??""} ${'currency'.tr()}"
                      :"0 ${'currency'.tr()}",
                      style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3))
                  :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                ],
              ),
              SizedBox(height: 1.h,),
              SizedBox(
                width: 55.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.h,
                      width: 30.w,
                      padding: EdgeInsetsDirectional.only(end: 1.h,start: 1.h),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5),),
                          color:MyColors.MainColor),
                      child: Row(
                        children: [
                          Obx(() =>
                              Visibility(
                                  visible: cartController.isVisable.value && cartController.selectedItemIndex.value == widget.cartItems!.cartItemId,
                                  child: SizedBox(
                                    width: 3.h,
                                      height: 3.h,
                                      child: const CircularProgressIndicator(color: MyColors.MainColor2,)))),
                          Obx(() => cartController.isVisable.value == true
                              && cartController.selectedItemIndex.value == widget.cartItems!.cartItemId
                              ? Container()
                              : Expanded(
                                  child: InkWell(
                                      onTap: () {
                                          if (widget.cartItems!.quantity! > 1) {
                                            if (widget.cartItems?.quantity != null) {
                                              widget.cartItems!.quantity = widget.cartItems!.quantity! - 1;
                                              cartController.isVisable.value=true;
                                              cartController.selectedItemIndex.value = widget.cartItems!.cartItemId!;

                                              cartController.updateCartQuantity(
                                                  widget.cartItems!.sku!,
                                                  widget.cartItems!.cartItemId!
                                                      .toString(),
                                                  widget.cartItems!.quantity!,
                                                  widget.cartItems!.productId!
                                                      .toString()).then((_){
                                                if(cartController.updateCartResponse.value.success==true){
                                                  cartController.isVisable.value=false;
                                                  widget.cartItems!.price.toString()!="null"?
                                                  updatePrice(widget.cartItems!.quantity!, widget.cartItems!.price!)
                                                      :updatePrice(widget.cartItems!.quantity!, 0);
                                                }else{
                                                  cartController.isVisable.value=false;
                                                }
                                              });
                                            }
                                          } else {
                                            cartController.isVisable.value=true;
                                            showModalBottomSheet<void>(
                                                isScrollControlled: true,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                ),
                                                context: context,
                                                backgroundColor: Colors.white,
                                                builder: (BuildContext context) => Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                                    child: DeleteScreen(id: null,
                                                      tittle: 'delete_cart_item'.tr(),
                                                      des: 'are_you_sure_you_want_to_delete_item'.tr(),
                                                      from: "itemCartMine",cartItems: widget.cartItems,)));
                                          }
                                      },
                                      child: SvgPicture.asset(
                                        'assets/mines.svg',
                                        color: Colors.white,
                                      )))),
                          Expanded(
                            child: Center(
                              child: Text(widget.cartItems?.quantity.toString()??"1",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'medium',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ),
                          ),
                          Obx(() =>
                              Visibility(
                                  visible: cartController.isVisable2.value
                                      && cartController.selectedItemIndex.value == widget.cartItems!.cartItemId,
                                  child: SizedBox(
                                      width: 3.h,
                                      height: 3.h,
                                      child: const CircularProgressIndicator(color: MyColors.MainColor2,)))),
                          Obx(() => cartController.isVisable2.value == true
                              && cartController.selectedItemIndex.value == widget.cartItems!.cartItemId
                              ? Container()
                              : Expanded(
                                  child: InkWell(
                                      onTap: () {
                                          if (widget.cartItems?.quantity !=
                                              null) {
                                            widget.cartItems!.quantity = widget.cartItems!.quantity! + 1;
                                            cartController.isVisable2.value=true;
                                            cartController.selectedItemIndex.value = widget.cartItems!.cartItemId!;

                                            cartController.updateCartQuantity(
                                                widget.cartItems!.sku!,
                                                widget.cartItems!.cartItemId!
                                                    .toString(),
                                                widget.cartItems!.quantity!,
                                                widget.cartItems!.productId!
                                                    .toString()).then((_){
                                                      if(cartController.updateCartResponse.value.success==true){
                                                        cartController.isVisable2.value=false;
                                                        widget.cartItems!.price.toString()!="null"?
                                                        updatePrice(widget.cartItems!.quantity!, widget.cartItems!.price!)
                                                            :updatePrice(widget.cartItems!.quantity!, 0);
                                                      }else{
                                                        cartController.isVisable2.value=false;
                                                      }
                                            });
                                          }
                                      },
                                      child: SvgPicture.asset(
                                        'assets/add.svg',
                                        color: Colors.white,
                                      ))))
                        ],
                      ),
                    ),
                    const Spacer(),
                    (widget.cartItems!.price.toString() != "null")
                        ? Text(
                            "${updatePrice(widget.cartItems!.quantity!, widget.cartItems!.price!).toString()} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'bold',
                                fontWeight: FontWeight.w600,
                                color: MyColors.MainColor))
                        : Text(
                            "${updatePrice(widget.cartItems!.quantity!, 0).toString()} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w600,
                                color: MyColors.MainColor))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  int updatePrice(int qun,int price){
    // setState(() {
    //   print("Debug: Quantity - $qun, Price - $price");
    //   cartController.subtotal.value = qun * price;
    //   print("Debug: Subtotal - ${cartController.subtotal.value}");
    // });
    cartController.calculateTotalPrice();
    return qun * price;
  }




}