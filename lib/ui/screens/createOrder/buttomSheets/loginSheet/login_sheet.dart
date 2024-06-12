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
import '../../../auth/login/login_screen.dart';

class LoginSheet extends StatefulWidget{
  var from;


  LoginSheet({required this.from});

  @override
  State<StatefulWidget> createState() {
    return _LoginSheet();
  }
}

class _LoginSheet extends State<LoginSheet>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset('assets/logo_login.svg',width: 100,height: 100,),
          ),
          SizedBox(height: 1.h,),
          Text('you_must_to_be_login'.tr(),
            style: TextStyle(fontSize: 14.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark1),
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
                    if (widget.from == "cart")
                      {
                        Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return LoginScreen(
                              from: "cart",
                            );
                          },
                        ), (route) => false)
                      }
                    else
                      {
                        Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return LoginScreen(
                              from: "",
                            );
                          },
                        ), (route) => false)
                      }
                  },
                  color: MyColors.STATUSEREDColor,
                  child: Text('login'.tr(), style:  TextStyle(fontSize: 12.sp,
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