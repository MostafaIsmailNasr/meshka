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
import '../buttomNavagation/buttom_navagation_page.dart';

class SuccessCartSheet extends StatefulWidget{
  var cartId;

  SuccessCartSheet(this.cartId);

  @override
  State<StatefulWidget> createState() {
    return _SuccessCartSheet();
  }
}

class _SuccessCartSheet extends State<SuccessCartSheet>{
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: SvgPicture.asset("assets/success2.svg",width: 10.h,height: 10.h,)),
          SizedBox(height: 1.h,),
          Text('the_product_has_been_added_successfully'.tr(),
            style: TextStyle(fontSize: 14.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark1),
            textAlign: TextAlign.center,),
          SizedBox(height: 1.h,),
          Text('view_the_products_in_your_shopping_cart'.tr(),
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
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      ButtomNavagationPage(2)), (Route<dynamic> route) => false)
                  },
                  color: MyColors.MainColor,
                  child: Text('cart'.tr(), style:  TextStyle(fontSize: 12.sp,
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
                      Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                          ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                    },
                    color: MyColors.Dark5,
                    child: Text('continue_shopping'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color: MyColors.Dark1)),

                  )
              )
            ],
          )
        ],
      ),
    );
  }

}