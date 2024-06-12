import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../business/cartController/CartController.dart';
import '../../../business/createOrderController/CreateOrderController.dart';
import '../../../conustant/my_colors.dart';
import '../../../conustant/toast_class.dart';
import '../../widget/CreatOrderProductItem.dart';
import '../../widget/DeliveryScheduleItem.dart';
import 'buttomSheets/addAddressSheet/add_address_sheet.dart';
import 'buttomSheets/chooseAddress/ChooseAddress.dart';
import 'buttomSheets/contactNumberSheet/contact_number_sheet.dart';

class CreateOrderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CreateOrderScreen();
  }
}

class _CreateOrderScreen extends State<CreateOrderScreen>with TickerProviderStateMixin{
  var selectedFlage=0;
  var isSelected=false;
  int? itemId=0;
  bool showText = true;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final ButtonStyle socialButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainTint5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: MyColors.MainTint4, width: 1)
      ));

  final _formKey = GlobalKey<FormState>();

  final createOrderController = Get.put(CreateOrderController());
  final cartController = Get.put(CartController());

  @override
  void initState() {
    createOrderController.getData(context);
    createOrderController.codeController.clear();
    createOrderController.discount.value=0.0;
    createOrderController.couponId.value="null";
    createOrderController.deliverTime.value="";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Transform.rotate(
                angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                child: SvgPicture.asset('assets/back.svg',))
        ),
        title: Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
        actions: [
          Container(width: 6.h,)
        ],
      ),
      body:Obx(() => !createOrderController.isLoading.value?
    Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contactNumber(),
              SizedBox(height: 1.h,),
              //billingArrivalAddress(),
              SizedBox(height: 1.h,),
              deliveryAddress(),
              SizedBox(height: 1.h,),
              deliverySchedule(),
              SizedBox(height: 1.h,),
              Text("order_details2".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w600,
                  color:MyColors.MainColor)),
              SizedBox(height: 1.h,),
              orderDetails(),
              SizedBox(height: 1.h,),
            ],
          ),
        ),
      ):const Center(child: CircularProgressIndicator(color: MyColors.MainColor,))),
      bottomNavigationBar: Container(
        height: 9.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5),),
            color:Colors.white),
        margin: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,bottom: 1.h),
        padding: EdgeInsetsDirectional.all(1.h),
        child: Column(
          children: [
            Center(
              child: Obx(() =>
                  Visibility(
                      visible: createOrderController.isVisable2.value,
                      child: const CircularProgressIndicator(color: MyColors.MainColor,)
                  )),
            ),
            Obx(() => createOrderController.isVisable2.value==true?Container():
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 7.h,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async{
                  permission();
                  //Navigator.pushNamed(context, '/success_dialog_screen');
                },
                child: Text('complete_payment'.tr(),
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void permission(){
    print("lk"+createOrderController.tittleAddress.value);
    if(createOrderController.contactNumber.value==""){
      ToastClass.showCustomToast(context, "enter_phone2".tr(), "error");
    }else if(createOrderController.tittleAddress.value==""
        ||createOrderController.streetAddress.value==""){
      ToastClass.showCustomToast(context, "select_address".tr(), "error");
    }else{
      createOrderController.checkout(
          createOrderController.productsJson.value,
          cartController.totalPrice1.value.toString(),
          createOrderController.couponId.value,
          createOrderController.discount.value.toString(),
          cartController.totalPrice1.value.toString(),
          createOrderController.tax.value,
          createOrderController.fees.value,
          createOrderController.totalPrice.value.toString(),
          createOrderController.deliverTime.value,
          createOrderController.contactNumber.value,
          "CASH_ON_DELIVERY",
          createOrderController.zipAddress.value,
          createOrderController.countryAddress.value,
          createOrderController.stateAddress.value,
          createOrderController.countryAddress.value,
          createOrderController.streetAddress.value,
          "",context);
    }
  }

  Widget contactNumber(){
    return Container(
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("contact_number".tr(), style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w600,
                  color:MyColors.MainColor)),
              const Spacer(),
              InkWell(
                onTap: (){
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      transitionAnimationController: AnimationController(vsync: this,duration: const Duration(milliseconds: 700)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: ContactNumberSheet()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/add2.svg'),
                    Text("update".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'bold',
                        fontWeight: FontWeight.w600,
                        color:MyColors.MainColor)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            width: MediaQuery.of(context).size.width,
              padding: EdgeInsetsDirectional.only(top: 1.5.h,bottom: 1.5.h,start: 1.h,end: 1.h),
            decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: MyColors.MainColor, width: 1.0,),
                  color:Colors.white),
            child: Text(createOrderController.contactNumber.value??"", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w600,
                color:MyColors.MainColor)),
          ),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }

 /* Widget billingArrivalAddress(){
    return Container(
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("billing_arrival_address".tr(), style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w500,
                  color:MyColors.MainColor)),
              const Spacer(),
              InkWell(
                onTap: (){
                  showModalBottomSheet<void>(
                      transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                      ),
                      //backgroundColor:MyColors.Dark5,
                      builder: (BuildContext context)=>DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.85,
                          minChildSize: 0.32,
                          maxChildSize: 0.9,
                          builder: (BuildContext context, ScrollController scrollController)=> SingleChildScrollView(
                            controller:scrollController,
                            child: AddAddressSheet(),
                          )
                        //return FilterOrdersScreen();
                      )
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/add2.svg'),
                    Text("update".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.MainColor)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsetsDirectional.only(top: 1.5.h,bottom: 1.5.h,start: 1.h,end: 1.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.MainColor, width: 1.0,),
                color:Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الدوحة", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color:MyColors.MainColor)),
                Text("مركز مدينة الغرافة (جزئيا في بلدية الريان)", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.MainTint1)),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }*/

  Widget deliveryAddress(){
    return Container(
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("delivery_address".tr(), style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w600,
                  color:MyColors.MainColor)),
              const Spacer(),
              InkWell(
                onTap: (){
                 if(createOrderController.addAddress.value!=true) {
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
                                   bottom: MediaQuery
                                       .of(context)
                                       .viewInsets
                                       .bottom),
                               child: ChooseAddress()));
                 }else {
                   showModalBottomSheet<void>(
                       transitionAnimationController: AnimationController(
                           vsync: this, duration: const Duration(seconds: 1)),
                       isScrollControlled: true,
                       context: context,
                       shape: const RoundedRectangleBorder(
                         borderRadius: BorderRadius.vertical(
                             top: Radius.circular(25)),
                       ),
                       backgroundColor: Colors.white,
                       //backgroundColor:MyColors.Dark5,
                       builder: (BuildContext context) =>
                           DraggableScrollableSheet(
                               expand: false,
                               initialChildSize: 0.85,
                               minChildSize: 0.32,
                               maxChildSize: 0.9,
                               builder: (BuildContext context,
                                   ScrollController scrollController) =>
                                   SingleChildScrollView(
                                     controller: scrollController,
                                     child: AddAddressSheet(from: "createOrder"),
                                   )
                             //return FilterOrdersScreen();
                           )
                   );
                 }
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/add2.svg'),
                    Obx(() => createOrderController.addAddress.value?
                    Text("add".tr(),
                        style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'bold',
                        fontWeight: FontWeight.w600,
                        color:MyColors.MainColor)):
                    Text("update".tr(),
                    style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w600,
                    color:MyColors.MainColor))),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsetsDirectional.only(top: 1.5.h,bottom: 1.5.h,start: 1.h,end: 1.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.MainColor, width: 1.0,),
                color:Colors.white),
            child: Obx(() => createOrderController.addAddress.value?
            Text("select_address".tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color:MyColors.MainColor)):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(createOrderController.tittleAddress.value,
                    style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color:MyColors.MainColor)),
                Text(createOrderController.streetAddress.value, style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.MainTint1)),
              ],
            )),
          ),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }

  Widget deliverySchedule(){
    return Container(
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("delivery_schedule".tr(), style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'bold',
              fontWeight: FontWeight.w600,
              color:MyColors.MainColor)),
          SizedBox(height: 1.h,),
          deliveryScheduleList(),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }

  Widget deliveryScheduleList(){
    if(createOrderController.timesList.isNotEmpty) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: createOrderController.timesList.length,
          itemBuilder: (context, int index) {
            return DeliveryScheduleItem(
              is_selected: selectedFlage == index,
              onTap: () {
                setState(() {
                  selectedFlage = index;
                  createOrderController.deliverTime.value=createOrderController.timesList[index].title;
                });
              },
              deliveryTime: createOrderController.timesList[index],
            );
          }
      );
    }else{
     return Container();
    }
  }

  Widget orderDetails(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:Colors.white),
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(1.5.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                border: Border.all(color: MyColors.MainTint4, width: 1.0,),
                color: MyColors.MainTint5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("product".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w600,
                    color:MyColors.Dark1)),
                Text("subtotal".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w600,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //productList(),
                //SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("subtotal".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark3)),
                    Text("${cartController.totalPrice1.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w600,
                        color:MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("tax".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark3)),
                    Text("${createOrderController.tax.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w600,
                        color:MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("shipping_fees".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark3)),
                    Text("${createOrderController.fees.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w600,
                        color:MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("discount".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark3)),
                    Text("${createOrderController.discount.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w600,
                        color:MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      showText = false;
                    });
                  },
                  child:showText?
                  Text("do_you_have_discount_coupon".tr(), style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.w600,
                      color:MyColors.SecondryColor))
                  :coupon(),
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("total".tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark3)),
                    Text("${createOrderController.totalPrice.value.toString()??""} ${'currency'.tr()}",
                        style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                SizedBox(height: 1.h,),
                Text("choose_payment_method".tr(), style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w600,
                    color:MyColors.MainColor)),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected=true;
                            itemId=0;
                          });
                        },
                        child: Container(
                          height: 10.h,
                          padding: EdgeInsetsDirectional.all(1.5.h),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color:isSelected==true && itemId==0?MyColors.MainColor: MyColors.MainTint5,
                                width: 1.0,),
                              color: Colors.white),
                          child: Image(image: AssetImage('assets/visa2.png'),width: 5.w,height: 6.h,)
                        ),
                      ),
                    ),
                    SizedBox(width: 1.h,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected=true;
                            itemId=1;
                          });
                        },
                        child: Container(
                          height: 10.h,
                          padding: EdgeInsetsDirectional.all(1.5.h),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                color: isSelected==true && itemId==1?MyColors.MainColor: MyColors.MainTint5,
                                width: 1.0,),
                              color: Colors.white),
                          child: Center(
                            child: Text("payment_when_receiving".tr(), style:  TextStyle(fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w600,
                                color:MyColors.MainColor),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /*Widget productList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount:3,
        itemBuilder: (context,int index){
          return CreatOrderProductItem();
        }
    );
  }*/

  Widget coupon(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 6.h,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: MyColors.MainTint4, width: 1.0,),
                color: Colors.white),
            child: couponCode(),
          ),
          SizedBox(height: 1.h,),
          Obx(() =>
              Visibility(visible: createOrderController.isVisable.value,
                  child: const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)))),
          SizedBox(height: 1.h,),
           Obx(() => createOrderController.isVisable.value==true?Container():
           SizedBox(
                  width: double.infinity,
                  height: 6.h,
                  child: TextButton(
                    style: socialButtonStyle,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        createOrderController.isVisable.value = true;
                        createOrderController.validateCoupon(context);
                      }
                    },
                    child: Text(
                      'apply'.tr(),
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'bold',
                          fontWeight: FontWeight.w600,
                          color: MyColors.MainColor),
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  Widget couponCode (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: createOrderController.codeController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_code'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'enter_discount_coupon'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.Dark3),
      ),
      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.Dark3),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

}