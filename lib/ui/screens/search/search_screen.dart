import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../business/searchController/SearchController.dart';
import '../../../conustant/my_colors.dart';
import '../../widget/search/SearchItem.dart';
import '../shimer_pages/onSellingShim/OnSellingShim.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen>{
  final controller = Get.put(SearchProductController());
  final FocusNode focusNode = FocusNode();
  bool isTextTyped = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.page = 1;
      controller.searchTxtController.text = "";
      controller.searchList.clear();
      //controller.search(controller.page,"");
      // controller.scroll.addListener(controller.scrollListener);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNode);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
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
      body:Obx(() =>!controller.isLoading.value?
      Container(
              margin:
                  EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: MyColors.Dark5,
                          width: 1.0,
                        ),
                        color: Colors.white),
                    child: Search(),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  //empty(),
                  Obx(() => !controller.isLoading2.value
                      ? Expanded(child: searchList())
                      : controller.page == 1
                          ? const Expanded(
                              child: Center(
                                  child: CircularProgressIndicator(
                              color: MyColors.MainColor,
                            )))
                          : Expanded(child: searchList())),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            )
          : OnSellingShim()
      ),
    );
  }

  Widget Search() {
    return TextFormField(
      textInputAction: TextInputAction.search,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.searchTxtController,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1.2.h, 0, 1.2.h, 0),
          child: SvgPicture.asset('assets/search_normal.svg'),
        ),
        suffixIcon: IconButton(
          icon: SvgPicture.asset("assets/close_circle.svg"),
          onPressed: () {
            controller.searchTxtController.clear();
            controller.searchList.clear();
            // Add any additional logic you need when the clear icon is pressed
          },
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.white70, style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(style: BorderStyle.solid, color: Colors.white70),
        ),
        hintText: 'search'.tr(),
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.Dark3,
        ),
      ),
      style: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'regular',
        fontWeight: FontWeight.w400,
        color: MyColors.Dark3,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        setState(() {
          isTextTyped = value.isNotEmpty;
        });
        if (value.isEmpty) {
          // If the text is empty, refocus the TextFormField
          FocusScope.of(context).requestFocus(focusNode);
          controller.searchList.clear();
        } else if (value.length >= 3) {
          // If the text is not empty, perform the search
          controller.search(1, value);
          controller.scroll.addListener(controller.scrollListener);
          if (isTextTyped) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        }

      },
    );
  }

  Widget searchList(){
    if(controller.searchList.isNotEmpty){
      return ListView.builder(
          controller: controller.scroll,
          scrollDirection: Axis.vertical,
          //shrinkWrap: true,
          //physics: const ScrollPhysics(),
          itemCount: controller.searchList.length,
          itemBuilder: (context,int index){
            if (controller.searchList[index].name != "loading") {
              return SearchItem(search: controller.searchList[index]);
            }else{
              return const Center(child: CircularProgressIndicator(color: MyColors.MainColor),);
            }
          }
      );
    }
    else{
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
              SvgPicture.asset('assets/no_search.svg'),
              SizedBox(height: 1.h,),
              Text('there_are_no_item'.tr(),
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w600,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text('item_will_appear_when_search'.tr(),
                style: TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w600,
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