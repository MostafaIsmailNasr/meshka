import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mashkah_library/ui/widget/home/featuredBooks/featuredBooks1/FeaturedBooksItem1.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../business/createOrderController/CreateOrderController.dart';
import '../../../../business/homeController/HomeController.dart';
import '../../../../business/productDetailsController/ProductDetailsController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../widget/home/bestSellingBooks/bestSellingBooks1/BestSellingBooksItem1.dart';
import '../../../widget/home/discounts/discounts1/DiscountsItem1.dart';
import '../../../widget/home/featuredBooks/flashSale2/FlashSale2.dart';
import '../../../widget/home/homeCategories/homeCategories1/HomeCategoriesItem1.dart';
import '../../../widget/home/newlyArrivedBooks/newlyArrivedBooks1/NewlyArrivedBooksItem1.dart';
import '../../../widget/home/shopByCategory/ShopByCategory.dart';
import '../../../widget/home/theMostFamousAuthors/theMostFamousAuthors1/TheMostFamousAuthorsItme1.dart';
import '../../categoryDetails/category_details_screen.dart';
import '../../productDetails/product_details_screen.dart';
import '../../shimer_pages/categoryShim/CategoryShim.dart';
import '../../shimer_pages/firstThreeImgsShim/FirstThreeImgsShim.dart';
import '../../shimer_pages/flashShim/FlashShim.dart';
import '../../shimer_pages/gridViewShim/GridViewShim.dart';
import '../../shimer_pages/onSellingShim/OnSellingShim.dart';
import '../../shimer_pages/singleImg/SingleImg.dart';
import '../../shimer_pages/twoImagShim/TwoImagShim.dart';
import '../buttom_navagation_page.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int currentIndex = 0;
  var con = true;

  final homeController = Get.put(HomeController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ));

  final createOrderController = Get.put(CreateOrderController());
  final productDetailsController = Get.put(ProductDetailsController());
  var x = "";


  @override
  void initState() {

    check();
    callingApis();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //x= homeController.sharedPreferencesService.getString("productType");
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: con ? RefreshIndicator(
            key: _refreshIndicatorKey,
            color: Colors.white,
            backgroundColor: MyColors.MainColor,
            strokeWidth: 4.0,
            onRefresh: () async {
              await check();
              con ?
              callingApis() : NoIntrnet();
            },
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsetsDirectional.only(
                    start: 2.h, end: 2.h, top: 2.h),
                child: Column(
                  children: [
                    appCustomBar(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? FristThreeImages()
                        : FirstThreeImgsShim()),
                    //Slider1(),
                    SizedBox(height: 2.h,),

                    ///
                    header('featured_categories'.tr(), "categories"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoading.value
                        ? category()
                        : SizedBox(height: 15.h, child: CategoryShim())),
                    SizedBox(height: 1.h,),

                    ///
                    header('featured_books'.tr(), "flash1"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingFlash1.value
                        ? flashSale()
                        : SizedBox(height: 33.h, child: FlashShim())),
                    SizedBox(height: 1.h,),

                    ///
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? Slider2()
                        : SizedBox(height: 15.h, child: SingleImg())),
                    SizedBox(height: 2.5.h,),

                    ///
                    header('shop_by_category'.tr(), "categories"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingShopCat.value
                        ? shopByCategory()
                        : SizedBox(height: 15.h, child: CategoryShim())),
                    SizedBox(height: 1.h,),

                    ///
                    header('best_selling_books'.tr(), "onSellingProduct"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingFlash1.value
                        ? onSellingProduct()
                        : SizedBox(height: 48.h, child: OnSellingShim())),
                    SizedBox(height: 1.h,),

                    ///
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? SecoundImages()
                        : SingleImg()),
                    SizedBox(height: 1.h,),

                    ///
                    header('featured_products'.tr(), "featuredProducts"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingFProduct.value
                        ? featuredProducts()
                        : SizedBox(height: 33.h, child: FlashShim())),
                    SizedBox(height: 1.h,),

                    ///
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? thirdImages()
                        : SingleImg()),
                    SizedBox(height: 1.h,),

                    ///
                    header('featured_books'.tr(), "flash1"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingFlash1.value
                        ? flashSale2()
                        : SizedBox(height: 68.h, child: GridViewShim())),
                    SizedBox(height: 1.h,),

                    ///
                    header('top_brands'.tr(), "brands"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingBrands.value
                        ? topBrands()
                        : SizedBox(height: 20.h, child: CategoryShim())),
                    SizedBox(height: 1.h,),

                    ///
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? fourthImages()
                        : TwoImagShim()),
                    SizedBox(height: 1.h,),

                    ///
                    header('newly_arrived_books'.tr(), "newlyArrivedBooks"),
                    SizedBox(height: 1.h,),
                    Obx(() =>
                    !homeController.isLoadingFProduct.value
                        ? newlyArrivedBooks()
                        : SizedBox(height: 68.h, child: GridViewShim())),
                    SizedBox(height: 1.h,),

                    ///
                    Obx(() =>
                    !homeController.isLoadingImages.value
                        ? fifthImages()
                        : SingleImg()),
                    SizedBox(height: 1.h,),
                  ],
                ),
              ),
            ),
          ) : NoIntrnet(),)
    );
  }

  Widget NoIntrnet() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/no_internet.svg'),
          //Image.asset('assets/no_internet.png'),
          SizedBox(height: 1.h,),
          Text('there_are_no_internet'.tr(),
            style: TextStyle(fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h,),
          Container(
            width: double.infinity,
            height: 6.h,
            margin: EdgeInsetsDirectional.only(start: 1.5.h, end: 1.5.h),
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () async {
                await check();
                callingApis();
              },
              child: Text('internet'.tr(),
                style: TextStyle(fontSize: 12.sp,
                    fontFamily: 'lexend_bold',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
            ),
          ),
        ],
      ),

    );
  }

  Future<void> check() async {
    final hasInternet = await InternetConnectivity().hasInternetConnection;
    setState(() {
      con = hasInternet;
    });
  }

  Widget appCustomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 6.h,
          height: 6.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.network(
              homeController.pic ?? "",
              loadingBuilder: (context, child,
                  loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const Center(child: CircularProgressIndicator()),
              errorBuilder: (context, error, stackTrace) =>
                  Center(child: SvgPicture.asset(
                    'assets/logo_login.svg', width: 5.h,)),
            ),
          ),
        ),
        SizedBox(width: 2.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                homeController.userName ?? "", style: TextStyle(fontSize: 14.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark1)),
            Text(homeController.emailUser ?? "",
                style: TextStyle(fontSize: 11.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark3)),
          ],
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/search_screen",);
            },
            child: SvgPicture.asset('assets/search.svg')),
        /*SizedBox(width: 3.h),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, "/notification_screen");
          },
          child: Container(
              margin: EdgeInsetsDirectional.only(end: 1.h),
              child: SvgPicture.asset('assets/notification.svg')),
        ),*/
      ],
    );
  }

  Widget FristThreeImages() {
    return Column(
      children: [
        Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 15.h,
            margin: EdgeInsetsDirectional.only(end: 1.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                homeController.gridBannerLargeImage,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const Center(child: CircularProgressIndicator(
                  color: MyColors.MainColor,)),
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: SvgPicture.asset('assets/logo_login.svg')),
              ),
              //const Image(image: AssetImage('assets/banner.png'),fit: BoxFit.fill,)
            )
        ),
        SizedBox(height: 1.h,),
        Row(
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 15.h,
                  margin: EdgeInsetsDirectional.only(end: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      homeController.gridBannerSList[0],
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const Center(child: CircularProgressIndicator(
                        color: MyColors.MainColor,)),
                      errorBuilder: (context, error, stackTrace) =>
                          Center(
                              child: SvgPicture.asset('assets/logo_login.svg')),
                    ),
                    //const Image(image: AssetImage('assets/banner.png'),fit: BoxFit.fill,)
                  )
              ),
            ),
            Expanded(
              child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 15.h,
                  margin: EdgeInsetsDirectional.only(end: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      homeController.gridBannerSList[1],
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const Center(child: CircularProgressIndicator(
                        color: MyColors.MainColor,)),
                      errorBuilder: (context, error, stackTrace) =>
                          Center(
                              child: SvgPicture.asset('assets/logo_login.svg')),
                    ),
                    //const Image(image: AssetImage('assets/banner.png'),fit: BoxFit.fill,)
                  )
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget SecoundImages() {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 15.h,
        margin: EdgeInsetsDirectional.only(end: 1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            homeController.vintageDemoBannerList[0] ?? "",
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.MainColor,
                )),
            errorBuilder: (context, error, stackTrace) =>
                Center(child: SvgPicture.asset('assets/logo_login.svg')),
          ),
        ));
  }

  Widget thirdImages() {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 15.h,
        margin: EdgeInsetsDirectional.only(end: 1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            homeController.vintageDemoBannerList[1] ?? "",
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.MainColor,
                )),
            errorBuilder: (context, error, stackTrace) =>
                Center(child: SvgPicture.asset('assets/logo_login.svg')),
          ),
        )
    );
  }

  Widget fourthImages() {
    return Row(
      children: [
        Expanded(
          child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 15.h,
              margin: EdgeInsetsDirectional.only(end: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  homeController.exclusiveBlockList[0] ?? "",
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                  (loadingProgress == null)
                      ? child
                      : const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.MainColor,
                      )),
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: SvgPicture.asset('assets/logo_login.svg')),
                ),
              )
          ),
        ),
        Expanded(
          child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 15.h,
              margin: EdgeInsetsDirectional.only(end: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  homeController.exclusiveBlockList[1] ?? "",
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                  (loadingProgress == null)
                      ? child
                      : const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.MainColor,
                      )),
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: SvgPicture.asset('assets/logo_login.svg')),
                ),
              )
          ),
        ),
      ],
    );
  }

  Widget fifthImages() {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 15.h,
        margin: EdgeInsetsDirectional.only(end: 1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            homeController.vintageDemoBannerList[2],
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.MainColor,
                )),
            errorBuilder: (context, error, stackTrace) =>
                Center(child: SvgPicture.asset('assets/logo_login.svg')),
          ),
        )
    );
  }

  /*Widget Slider1(){
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsetsDirectional.only(end: 1.h),
                  decoration: BoxDecoration(
                      color: MyColors.MainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(image: AssetImage('assets/banner.png'),fit: BoxFit.fill,)
                  )
              ),
          options: CarouselOptions(
              height: 20.h,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index, CarouselPageChangedReason reason) => {
                setState(() => {currentIndex = index})
              }),
        ),
        Positioned(
          bottom: 0,
          left: 1.h,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentIndex.toDouble(),
            decorator: DotsDecorator(
              size:  Size.square(1.h),
              activeSize:  Size(2.h, 1.h),
              activeColor: MyColors.MainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        )
      ],

    );
  }*/

  Widget header(String tittle, String from) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tittle, style: TextStyle(fontSize: 16.sp,
            fontFamily: 'bold',
            fontWeight: FontWeight.w700,
            color: MyColors.Dark1)),
        InkWell(
          onTap: () {
            if (from == "categories") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtomNavagationPage(1),
                ),
              );
            } else if (from == "flash1") {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CategoryDetailsScreen(
                            slug: "tags.slug:flash-sale;status:publish",
                            name: 'featured_books'.tr(),
                            tags: "flash-sale",
                            from: "",
                          )));
            } else if (from == "onSellingProduct") {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CategoryDetailsScreen(
                            slug: "tags.slug:on-sale;status:publish",
                            name: 'best_selling_books'.tr(),
                            tags: "on-sale",
                            from: "",
                          )));
            } else if (from == "featuredProducts") {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CategoryDetailsScreen(
                            slug: "tags.slug:featured-products;status:publish",
                            name: 'featured_products'.tr(),
                            tags: "featured-products",
                            from: "",
                          )));
            } else if (from == "newlyArrivedBooks") {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CategoryDetailsScreen(
                            slug: "status:publish",
                            name: 'newly_arrived_books'.tr(),
                            tags: "",
                            from: "",
                          )));
            }
          },
          child: Text(from != "brands" ? 'view_all'.tr() : "",
              style: TextStyle(fontSize: 14.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w600,
                  color: MyColors.MainColor2)),
        ),
      ],
    );
  }

  Widget category() {
    if (homeController.categoryList.isNotEmpty) {
      return SizedBox(
        height: 15.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: homeController.categoryList.length,
            itemBuilder: (context, int index) {
              return HomeCategoriesItem1(
                  category: homeController.categoryList[index]
              );
            }
        ),
      );
    } else {
      return Container();
    }
  }

  Widget shopByCategory() {
    if (homeController.shopCategoryList.isNotEmpty) {
      return SizedBox(
        height: 15.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: homeController.shopCategoryList.length,
            itemBuilder: (context, int index) {
              return HomeCategoriesItem1(
                  category: homeController.shopCategoryList[index]
              );
            }
        ),
      );
    } else {
      return Container();
    }
  }

  Widget flashSale() {
    if (homeController.flashSale1List.isNotEmpty) {
      return SizedBox(
        height: 33.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: homeController.flashSale1List.length,
            itemBuilder: (context, int index) {
              return FeaturedBooksItem1(
                flash: homeController.flashSale1List[index],
              );
            }
        ),
      );
    } else {
      return Container();
    }
  }

  Widget Slider2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: homeController.promotionBannerList.length,
          itemBuilder: (BuildContext context, int itemIndex,
              int pageViewIndex) =>
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsetsDirectional.only(end: 1.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      homeController.promotionBannerList[itemIndex],
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const Center(child: CircularProgressIndicator(
                        color: MyColors.MainColor,)),
                      errorBuilder: (context, error, stackTrace) =>
                          Center(
                              child: SvgPicture.asset('assets/logo_login.svg')),
                    ),
                  )
              ),
          options: CarouselOptions(
              height: 20.h,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              //autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index, CarouselPageChangedReason reason) =>
              {
                setState(() => {currentIndex = index})
              }),
        ),
        /*DotsIndicator(
          dotsCount: 3,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            size:  Size.square(1.h),
            activeSize:  Size(2.h, 1.h),
            activeColor: MyColors.MainColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )*/
      ],

    );
  }

  Widget onSellingProduct() {
    if (homeController.onSProductList.isNotEmpty) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeController.onSProductList.length,
          itemBuilder: (context, int index) {
            return BestSellingBooksItem1(
              sProduct: homeController.onSProductList[index],
            );
          }
      );
    } else {
      return Container();
    }
  }

  Widget featuredProducts() {
    if (homeController.fProductList.isNotEmpty) {
      return SizedBox(
        height: 33.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: homeController.fProductList.length,
            itemBuilder: (context, int index) {
              return FeaturedBooksItem1(
                flash: homeController.fProductList[index],
              );
            }
        ),
      );
    } else {
      return Container();
    }
  }

  Widget flashSale2() {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (6 / 10),
          crossAxisSpacing: 17,
          mainAxisSpacing: 8,
        ),
        itemCount: homeController.flashSale1List.length,
        itemBuilder: (context, int index) {
          return FeaturedBooksItem1(
            flash: homeController.flashSale1List[index],
          ); //FlashSale2();
        });
  }

  Widget newlyArrivedBooks() {
    if (homeController.newArrivalList.isNotEmpty) {
      return GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (6 / 10),
            crossAxisSpacing: 17,
            mainAxisSpacing: 8,
          ),
          itemCount: homeController.newArrivalList.length,
          itemBuilder: (context, int index) {
            return FeaturedBooksItem1(
              flash: homeController.newArrivalList[index],
            );
            /*NewlyArrivedBooksItem1(
              newArr: homeController.newArrivalList[index],
            );*/
          });
    } else {
      return Container();
    }
  }

  Widget topBrands() {
    if (homeController.brandsList.isNotEmpty) {
      return SizedBox(
        height: 20.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: homeController.brandsList.length,
            itemBuilder: (context, int index) {
              return TheMostFamousAuthorsItme1(
                  brandsResponse: homeController.brandsList[index]
              );
            }
        ),
      );
    } else {
      return Container();
    }
  }

  void callingApis() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      homeController.getHomeCategory(context, "home");
      homeController.getHomeCategory(context, "shopCat");
      homeController.getHomeData(
          1,
          "tags.slug:flash-sale;status:publish",
          "DESC",
          "created_at",
          "flash-sale");
      homeController.getHomeData(
          1,
          "tags.slug:on-sale;status:publish",
          "DESC",
          "created_at",
          "on-sale");
      homeController.getHomeData(
          1,
          "tags.slug:featured-products;status:publish",
          "DESC",
          "created_at",
          "featured-products");
      homeController.getHomeData(
          1,
          "status:publish",
          "DESC",
          "created_at",
          "");
      homeController.getBrands();
      homeController.getHomeImages();
      //getCurrentLocation();

      print("cv " + x);
      initDynamicLinks("simple");
      /*if(x!=null) {
        if (x == "simple") {
          print("llkk1");
          initDynamicLinks("simple");
        } else if(x=="variable") {
          print("llkk2");
          initDynamicLinks("");
        }else{
          print("llkk3");
        }
      }*/
    });
  }

  /*getCurrentLocation() async {
    // Request permission to access the device's location
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle the scenario when the user denies permission
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the scenario when the user denies permission forever
      return;
    }

    // Get the current position (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    createOrderController.lat = position.latitude;
    createOrderController.lng = position.longitude;

    // Convert the position into an address
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // Extract the address name from the placemark
    Placemark placemark = placemarks.first;
    String tittle = placemark.name ?? '';
    String country = placemark.country ?? "";
    String street = placemark.street ?? "";

    // Update the UI with the current address
    setState(() {
      homeController.streetAddress.value = street;
      homeController.countryAddress.value = country;
      homeController.tittleAddress.value = tittle;
    });
  }*/


  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLinks(String type) async {
    final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // ignore: unawaited_futures
      print(deepLink.queryParameters);
      int commaIndex = deepLink.toString().indexOf(",");
      var proType = deepLink.toString().substring(commaIndex);
      String modifiedUrl = deepLink.toString().substring(0, commaIndex);
      Uri uri = Uri.parse(modifiedUrl);

      print("Original URL: ${deepLink.toString()}");
      print("ddds: $proType");
      print("Modified URL: $modifiedUrl");
      if (Get.context != null) {
        var productID = uri.queryParameters["productId"];
        //var productType = deepLink.queryParameters["type"];
        print("productId");
        print(productID);
        if (proType == ",simple") {
          Navigator.of(Get.context!).push(
            MaterialPageRoute(
                builder: (_) =>
                    ProductDetailsScreen(productId: productID.toString(),
                      type: "simple", id: "",)),
          );
        } else {
          Navigator.of(Get.context!).push(
            MaterialPageRoute(
                builder: (_) =>
                    ProductDetailsScreen(productId: productID.toString(),
                      type: "", id: "",)),
          );
          print("kkklkd");
        }
      }
      dynamicLinks.onLink.listen((dynamicLinkData) {
        int commaIndex = dynamicLinkData.link.toString().indexOf(",");

        // Replace everything from "," to the end with an empty string
        var proType = dynamicLinkData.link.toString().substring(commaIndex);
        String modifiedUrl = dynamicLinkData.link.toString().substring(
            0, commaIndex);
        Uri uri = Uri.parse(modifiedUrl);

        print("Original URL: ${dynamicLinkData.link.toString()}");
        print("ddds: $proType");
        print("Modified URL: $modifiedUrl");
        if (Get.context != null) {
          var productID = uri.queryParameters["productId"];
          print("productId");
          print(productID);
          if (proType == ",simple") {
            Navigator.of(Get.context!).push(
              MaterialPageRoute(
                  builder: (_) =>
                      ProductDetailsScreen(productId: productID.toString(),
                        type: "simple", id: "",)),
            );
          } else {
            Navigator.of(Get.context!).push(
              MaterialPageRoute(
                  builder: (_) =>
                      ProductDetailsScreen(productId: productID.toString(),
                        type: "", id: "",)),
            );
            print("kkklkd");
          }
        }
      }).onError((error) {
        print('onLink error');
        print(error.message);
      });
    }
  }
}