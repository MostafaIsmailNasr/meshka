import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mashkah_library/conustant/my_colors.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../business/categoryProductsController/CategoryProductsController.dart';
import '../../widget/categoryDetails/CategoryDetailsItem.dart';
import '../empty/empty_screen.dart';
import '../filter/categoryFilter/filter_screen.dart';
import '../filter/filterBy/filter_by_screen.dart';
import '../shimer_pages/categoryDetailsShim/CategoryDetailsShim.dart';
import '../shimer_pages/categoryProductShimmer.dart';

class CategoryDetailsScreen extends StatefulWidget{
  String slug,name,tags,from;

  CategoryDetailsScreen({required this.slug,required this.name,required this.tags,required this.from});

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailsScreen();
  }
}

class _CategoryDetailsScreen extends State<CategoryDetailsScreen>with TickerProviderStateMixin{
  final ButtonStyle socialButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: MyColors.Dark5, width: 1)
      ));
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ));
  final categoryProductsController = Get.put(CategoryProductsController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  var con=true;

  @override
  void initState() {
    check();
    categoryProductsController.slug=widget.slug;
    categoryProductsController.tags=widget.tags;
    clearData();
    categoryProductsController.getCategoryProduct(
        categoryProductsController.page ,
        widget.slug,
        categoryProductsController.sortedBy,
        categoryProductsController.orderBy,
        categoryProductsController.sendCatName,
        categoryProductsController.sendBrandName,
        categoryProductsController.sendPrice,
        widget.tags);
    categoryProductsController.scroll.addListener(categoryProductsController.scrollListener);
    super.initState();
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
                check();
                categoryProductsController.slug=widget.slug;
                categoryProductsController.tags=widget.tags;
                clearData();
                categoryProductsController.getCategoryProduct(
                    categoryProductsController.page ,
                    widget.slug,
                    categoryProductsController.sortedBy,
                    categoryProductsController.orderBy,
                    categoryProductsController.sendCatName,
                    categoryProductsController.sendBrandName,
                    categoryProductsController.sendPrice,
                    widget.tags);
                categoryProductsController.scroll.addListener(categoryProductsController.scrollListener);
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
        backgroundColor: Colors.white,
        leading:widget.from!="navigator"?
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Transform.rotate(
                angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                child: SvgPicture.asset('assets/back.svg',))
        ):Container(),
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
      body:con? RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Colors.white,
          backgroundColor: MyColors.MainColor,
          strokeWidth: 4.0,
          onRefresh: () async {
            await check();
            con?
            callingApis():NoIntrnet();
          },
          child: Obx(() =>!categoryProductsController.isLoading.value?
          Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
                height: 10.h,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                color: MyColors.MainTint5),
                child: Center(
                  child: Text(
                    "# ${widget.name}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                        color: MyColors.Dark1)
                  ),
                )),
            SizedBox(height: 1.h,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: TextButton(
                        style: socialButtonStyle,
                        onPressed: () async{
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              context: context,
                              backgroundColor: Colors.white,
                              builder: (BuildContext context) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom),
                                  child: FilterByScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/arrow_swap.svg'),
                            SizedBox(width: 1.h,),
                            Text('filter_by'.tr(),
                              style:  TextStyle(fontSize: 14.sp,
                                  fontFamily: 'regular',
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.MainColor),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.h,),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: TextButton(
                        style: socialButtonStyle,
                        onPressed: () async{
                          showModalBottomSheet<void>(
                              transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                              ),
                              //backgroundColor:MyColors.Dark5,
                              builder: (BuildContext context)=>DraggableScrollableSheet(
                                  expand: false,
                                  initialChildSize: 0.9,
                                  minChildSize: 0.32,
                                  maxChildSize: 0.9,
                                  builder: (BuildContext context, ScrollController scrollController)=> SingleChildScrollView(
                                    controller:scrollController,
                                    child: FilterScreen(),
                                  )
                                //return FilterOrdersScreen();
                              )
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/filter.svg'),
                            SizedBox(width: 1.h,),
                            Text('filter'.tr(),
                              style:  TextStyle(fontSize: 14.sp,
                                  fontFamily: 'regular',
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.MainColor),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => !categoryProductsController.isLoading2.value
                ?  Expanded(child: categoryList()): categoryProductsController.page==1?
            const Expanded(
                child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.MainColor,
                    ))):Expanded(child: categoryList())),
            Center(
              child: Obx(() =>
                  Visibility(
                      visible: categoryProductsController.isVisable.value,
                      child: const CircularProgressIndicator(color: MyColors.MainColor,)
                  )),
            ),
          ],
        ),
      )
            :CategoryDetailsShim())):NoIntrnet(),
    );
  }
  void callingApis() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      clearData();
      categoryProductsController.getCategoryProduct(
          categoryProductsController.page,
          widget.slug,
          categoryProductsController.sortedBy,
          categoryProductsController.orderBy,
          categoryProductsController.sendCatName,
          categoryProductsController.sendBrandName,
          categoryProductsController.sendPrice,
          widget.tags);
    });

  }

  Widget categoryList() {
    if(categoryProductsController.productCatList.isNotEmpty){
      return GridView.builder(
        controller: categoryProductsController.scroll,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (3 /5),
          crossAxisSpacing: 12,
          mainAxisSpacing: 8,
        ),
        itemCount: categoryProductsController.productCatList.length, // Add 1 for the loading indicator
        itemBuilder: (context, int index) {
          return CategoryDetailsItem(
            categoryProduct: categoryProductsController.productCatList[index],
          );
        },
      );
    }else{
      return EmptyScreen(
        image: 'assets/empty.svg',
        tittle: 'the_section_is_empty'.tr(),
        des: 'there_is_no_product'.tr(),
      );
    }
  }

  void clearData() {
    categoryProductsController.page=1;
    categoryProductsController.sendPrice="";
    categoryProductsController.sortedBy="DESC";
    categoryProductsController.orderBy="created_at";
    categoryProductsController.sendCatName="";
    categoryProductsController.sendBrandName="";
    categoryProductsController.selectedIds.clear();
    categoryProductsController.selectedIdsBrands.clear();
    categoryProductsController.isCheckedPrice50=false;
    categoryProductsController.isCheckedPrice100=false;
    categoryProductsController.isCheckedPrice150=false;
    categoryProductsController.isCheckedPrice200=false;
    categoryProductsController.isCheckedPrice300=false;
    categoryProductsController.isCheckedPrice500=false;
    categoryProductsController.isCheckedPrice1000=false;
    categoryProductsController.isCheckedPrice1100=false;
    categoryProductsController.sendCatList.clear();
    categoryProductsController.sendBrandList.clear();
    categoryProductsController.priceList.clear();
  }
}