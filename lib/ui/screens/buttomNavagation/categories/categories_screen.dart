import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/homeController/HomeController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../widget/home/homeCategories/homeCategories1/HomeCategoriesItem1.dart';
import '../../empty/empty_screen.dart';
import '../../shimer_pages/categoryButtomShim/category_buttom_shim.dart';

class CategoriesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CategoriesScreen();
  }
}

class _CategoriesScreen extends State<CategoriesScreen>{
  final homeController = Get.put(HomeController());
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ));
  var con=true;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      check();
      homeController.getHomeCategory(context, "");
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
        actions: [
          Container()
        ],
      ),
      body:con?
      Obx(() => !homeController.isLoading.value? Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: categories(),
      ):CategoryButtomShim()):NoIntrnet(),
    );
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
                homeController.getHomeCategory(context, "");
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

  Widget categories(){
    if(homeController.categoryList.isNotEmpty){
      return GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (2/ 2),
            crossAxisSpacing: 1,
            mainAxisSpacing: 0,
          ),
          itemCount: homeController.categoryList.length,
          itemBuilder: (context, int index) {
            return HomeCategoriesItem1(
              category: homeController.categoryList[index],
            );
          });
    }else{
      return EmptyScreen(
        image: 'assets/empty.svg',
        tittle: 'the_section_is_empty'.tr(),
        des: 'there_is_no_section'.tr(),
      );
    }
  }

}