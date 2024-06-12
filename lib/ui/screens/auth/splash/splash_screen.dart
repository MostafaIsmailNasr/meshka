import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:mashkah_library/conustant/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../buttomNavagation/buttom_navagation_page.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}
class _SplashScreen extends State<SplashScreen>{

  @override
  void initState() {

    super.initState();
    time();
  }

  time() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("cartId");
    print("hhgd "+prefs.getString("cartId").toString());
    await Timer(
      const Duration(seconds: 5),
          () {

        if (prefs.getBool("islogin") == true) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              ButtomNavagationPage(0)), (Route<dynamic> route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, "/into_slider_screen", ModalRoute.withName('/into_slider_screen'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.MainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.asset('assets/meshkah_logo.svg'),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 50),
            child: Center(
              child: JumpingDots(
                color: MyColors.LoaderColor,
                radius: 10,
                numberOfDots: 3,
                animationDuration: const Duration(milliseconds: 200),
              ),
            ),
          )
        ],
      ),
    );
  }

}