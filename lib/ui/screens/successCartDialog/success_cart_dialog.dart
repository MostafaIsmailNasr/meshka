import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashkah_library/conustant/my_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../buttomNavagation/buttom_navagation_page.dart';


class SuccessCartDialog extends StatefulWidget{
  var cartId;

  SuccessCartDialog(this.cartId);

  @override
  State<StatefulWidget> createState() {
    return _SuccessCartDialog();
  }
}

class _SuccessCartDialog extends State<SuccessCartDialog>with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
      backgroundColor: MyColors.Dark5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);
    controller!.addListener(() {
      setState(() {});
    });
    controller!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation!,
            child: Container(
              width:350,
              decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 248, 244, 244),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
              child: Padding(
                padding:  EdgeInsets.only(bottom: 2.h, top: 1.h,right: 1.h,left: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/close_circle.svg")),
                    SizedBox(height: 1.h),
                    Center(child: SvgPicture.asset("assets/success2.svg",width: 10.h,height: 10.h,)),
                    SizedBox(height: 1.h),
                    Text(
                    'the_product_has_been_added_successfully'.tr(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'bold',
                        fontWeight: FontWeight.w500,
                        color: MyColors.Dark1),textAlign: TextAlign.center,),
                    SizedBox(height: 1.h),
                    Center(
                      child: Text(
                        'view_the_products_in_your_shopping_cart'.tr(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'medium',
                            fontWeight: FontWeight.w500,
                            color: MyColors.Dark2),textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h, top: 1.h),
                            width: double.infinity,
                            height: 6.h,
                            child: TextButton(
                              style: flatButtonStyle,
                              onPressed: () async {
                                //Navigator.pushNamed(context,'/cart_screen',arguments: widget.cartId);
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    ButtomNavagationPage(2)), (Route<dynamic> route) => false);
                              },
                              child: Text(
                                'cart'.tr(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h, top: 1.h),
                            width: double.infinity,
                            height: 6.h,
                            child: TextButton(
                              style: flatButtonStyle2,
                              onPressed: () async {
                                // Navigator.pushNamed(context, "/Verfiy_code_screen",arguments:PhoneController.text);
                                Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                    ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                              },
                              child: Text(
                                'continue_shopping'.tr(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.Dark1),textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
                ),
              ),
            ),
          ),
        ),
      );
  }

}