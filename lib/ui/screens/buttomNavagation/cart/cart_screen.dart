import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/cartController/CartController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../widget/cart/CartItem.dart';
import '../../createOrder/buttomSheets/deleteSheet/delet_sheet.dart';
import '../../createOrder/buttomSheets/loginSheet/login_sheet.dart';
import '../../shimer_pages/cartShim/CartShim.dart';

class CartScreen extends StatefulWidget{
  var cartId;

  CartScreen({required this.cartId});

  @override
  State<StatefulWidget> createState() {
    return _CartScreen();
  }
}

class _CartScreen extends State<CartScreen>{
  final cartController = Get.put(CartController());
  var con=true;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ));

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      check();
      print("ssbn "+widget.cartId.toString());
      if(widget.cartId!="null") {
        cartController.cartId.value = widget.cartId;
        cartController.getCart(widget.cartId);
      }else{
        cartController.cartList.clear();
        empty();
        cartController.isLoading2.value=false;
      }
    });
    super.initState();
  }

  Future<void> check()async{
    final hasInternet = await InternetConnectivity().hasInternetConnection;
    setState(() {
      con = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return con? Obx(() => !cartController.isLoading2.value?
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
        actions: [//widget.cartId!=""||
          (cartController.cartList.isNotEmpty)?
          GestureDetector(
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
                          tittle: 'delete_all_cart'.tr(),
                          des: 'are_you_sure_you_want_to_delete_cart'.tr(),
                          from: "allCart",
                        cartItems: null,)));
              //cartController.deleteCart(cartController.cartId.value,context);
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 1.h),
              child: IconButton(
                  onPressed: () => {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20)),
                        ),
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (BuildContext context) =>
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                                child: DeleteScreen(
                                  id: null,
                                  tittle: 'delete_all_cart'.tr(),
                                  des: 'are_you_sure_you_want_to_delete_cart'.tr(),
                                  from: "allCart",
                                  cartItems: null,)))
                                    // cartController.deleteCart(cartController.cartId.value,context)
                  },
                  icon: SvgPicture.asset('assets/trash.svg',)),
            ),
          )
              :Container(),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: cartList(),
      ),
      bottomNavigationBar:cartController.cartList.isNotEmpty?
      InkWell(
        onTap: (){
          if(cartController.sharedPreferencesService.getBool("islogin")==true) {
            Navigator.pushNamed(context, '/create_order_screen');
          }else{
            showModalBottomSheet<void>(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)),
                ),
                context: context,
                backgroundColor: Colors.white,
                builder: (BuildContext context) =>
                    Padding(
                        padding: EdgeInsets.only(
                            bottom:
                            MediaQuery.of(context).viewInsets.bottom),
                        child: LoginSheet(from: "cart",)));
          }
        },
        child: Container(
          height: 7.h,
          margin: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,bottom: 1.h),
          padding: EdgeInsetsDirectional.all(1.h),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5),),
              color:MyColors.MainColor),
          child: Row(
            children: [
              Text("continue_to_payment".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w500,
                  color:Colors.white)),
              const Spacer(),
              SvgPicture.asset('assets/line.svg'),
              SizedBox(width: 1.h,),
              Text("${cartController.totalPrice1.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w600,
                  color:Colors.white)),
            ],
          ),
        ),
      )
          :Container(height: 1.h,),
    ) :  Scaffold(body: CartShim(),)):Scaffold(body: NoIntrnet(),);
  }

  Widget NoIntrnet(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/no_internet.svg'),
          //Image.asset('assets/no_internet.png'),
          SizedBox(height: 1.h,),
          Text('there_are_no_internet'.tr(),
            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h,),
          Container(
            width: double.infinity,
            height: 6.h,
            margin:  EdgeInsetsDirectional.only(start: 1.5.h, end: 1.5.h),
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () async{
                await check();
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  print("ss "+widget.cartId.toString());
                  if(widget.cartId!="null") {
                    cartController.cartId.value = widget.cartId;
                    cartController.getCart(widget.cartId);
                  }else{
                    cartController.cartList.clear();
                    empty();
                    cartController.isLoading2.value=false;
                  }
                });
              },
              child: Text('internet'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'lexend_bold',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
            ),
          ),
        ],
      ),

    );
  }

  Widget cartList(){
    if(cartController.cartList.isNotEmpty){
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount:cartController.cartList.value.length,
          itemBuilder: (context,int index){
            return
              CartItem(
                cartItems: cartController.cartList[index],
              );
          }
      );
    }else{
      return empty();
    }

  }
}

class empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      //margin: EdgeInsets.only(top: 10.h),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/no_orders.svg'),
              SizedBox(height: 1.h,),
              Text('cart_empty'.tr(),
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text('products_will_appear_hear'.tr(),
                style: TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}