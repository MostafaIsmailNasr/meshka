import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mashkah_library/ui/screens/empty/empty_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/myLocation/my_location_screen.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../business/productDetailsController/ProductDetailsController.dart';
import '../../../conustant/my_colors.dart';
import '../../widget/product/relatedBooks/RelatedBooksItem.dart';
import '../../widget/product/variableItem/VariableItem.dart';
import '../shimer_pages/productDetailsShim/ProductDetailsShim.dart';
import '../successCartDialog/success_cart_dialog.dart';

class ProductDetailsScreen extends StatefulWidget{
  String productId,type,id;

  ProductDetailsScreen({required this.productId,required this.type,required this.id});

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsScreen();
  }
}

class _ProductDetailsScreen extends State<ProductDetailsScreen>{
  int currentIndex = 0;
  var con=true;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
      backgroundColor: MyColors.Dark3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final productDetailsController = Get.put(ProductDetailsController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      check();
      productDetailsController.getDeviceInfo(context);
      productDetailsController.quantity.value=1;
      productDetailsController.addedVariableList.clear();
      productDetailsController.tittleSearch="";
      productDetailsController.isExiste.value=false;
      productDetailsController.productType.value=widget.type;
      if(widget.type=="simple"){
        productDetailsController.getHomeCategory(widget.productId,"categories");
      }else{
        productDetailsController.getHomeCategory(widget.productId,"categories;variations;variations.attribute.values;variation_options");
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

  Future<String> createDynamicLink(bool short, String courseID, String type) async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    String dynamicLink = 'https://meshka.page.link/meshka?productId=${'$courseID,$type'}';
    print("vxvxv"+dynamicLink);
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://meshka.page.link',
      longDynamicLink: Uri.parse(
        'https://meshka.page.link?efr=0&ibi=com.sahl.mashkah_library&apn=com.sahl.mashkah_library&imv=0&amv=0&link=$dynamicLink&ofl=https://ofl-example.com',
      ),
      link: Uri.parse(dynamicLink),
      androidParameters: const AndroidParameters(
        packageName: 'com.sahl.mashkah_library',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.sahl.mashkahLibrary',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    Share.share('Visit FlutterCampus at ${url.toString()}');

    return url.toString();
  }

  @override
  Widget build(BuildContext context) {
    return con?  Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Obx(() => !productDetailsController.isLoading.value?
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              Slider(),
              Container(
                margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productDetailsController.productDetailsResponse.value.name??"",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.w700,
                            color: MyColors.Dark1)),
                    Text(productDetailsController.productDetailsResponse.value.description??"",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'light',
                            fontWeight: FontWeight.w300,
                            color: MyColors.MainTint1)),
                    widget.type=="simple"?
                    Row(
                      children: [

                        productDetailsController.productDetailsResponse.value.salePrice.toString()!="null"?
                        Text("${productDetailsController.productDetailsResponse.value.salePrice.toString()??""} ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 14.sp,
                              fontFamily: 'regular',
                              fontWeight: FontWeight.w700,
                              color:MyColors.MainColor,
                            ))
                            :Container(),
                        SizedBox(width: 1.h,),
                        productDetailsController.productDetailsResponse.value.salePrice.toString()!="null"?
                        Text(productDetailsController.productDetailsResponse.value.price.toString()!="null"?
                        "${productDetailsController.productDetailsResponse.value.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 12.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w400,
                                color:MyColors.Dark4,
                                decoration: TextDecoration.lineThrough))

                            :Text(productDetailsController.productDetailsResponse.value.price.toString()!="null"?
                        "${productDetailsController.productDetailsResponse.value.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color:MyColors.MainColor)),
                      ],
                    )
                    /*Row(
                      children: [
                        productDetailsController.productDetailsResponse.value.price.toString()!="null"?
                        Text("${productDetailsController.productDetailsResponse.value.price.toString()??"0"} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color: MyColors.MainColor))
                        :Text("0 ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color: MyColors.MainColor)),
                        SizedBox(
                          width: 1.h,
                        ),
                        productDetailsController.productDetailsResponse.value.salePrice.toString()!="null"?
                        Text("${productDetailsController.productDetailsResponse.value.salePrice.toString()??"0"} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark4,
                                decoration: TextDecoration.lineThrough))
                            :Text("0 ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark4,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    )*/
                    :
                    Obx(() => Row(
                      children: [
                        productDetailsController.maxPrice.value!="null"?
                        Text("${productDetailsController.maxPrice.value??"0"} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color: MyColors.MainColor))
                            :Text("0 ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color: MyColors.MainColor)),
                        SizedBox(
                          width: 1.h,
                        ),
                        productDetailsController.minPrice.value!="null"?
                        Text("${productDetailsController.minPrice.value??"0"} ${'currency'.tr()}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color: MyColors.MainColor))
                            :Container(),
                      ],
                    )),
                    SizedBox(height: 2.h,),
                    widget.type!="simple"? variableSection():Container(),
                    SizedBox(height: 1.h,),
                    SvgPicture.asset(
                      'assets/saperator.svg',
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 2.h,),
                    /*Row(
                      children: [
                        Text('publishing_house'.tr(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark3)),
                        Text("دار دون للنشر والتوزيع",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark2)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('type'.tr(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark3)),
                        Text("كتاب",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark2)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('ISBN'.tr(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark3)),
                        Text("9789778062601",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.Dark2)),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SvgPicture.asset(
                      'assets/saperator.svg',
                      width: MediaQuery.of(context).size.width,
                    ),*/
                    Text('related_books'.tr(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.w700,
                            color: MyColors.Dark1)),
                    SizedBox(height: 1.h,),
                    relatedBooks()
                  ],
                ),
              ),
            ],
          ),
        )
            :ProductDetailsShim()),
      ),
      bottomNavigationBar: Obx(() =>  Container(
        color: Colors.white,
        height: 8.h,
        child:productDetailsController.productDetailsResponse.value.inStock==1?
        Obx(() =>productDetailsController.isExiste.value!=true?
        Row(
          children: [
            Obx(() =>
                Visibility(
                    visible: productDetailsController.isVisable.value,
                    child: const CircularProgressIndicator(color: MyColors.MainColor2,))),
          Obx(() => productDetailsController.isVisable.value == true?
              Container():
          Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h,),
                width: double.infinity,
                height: 6.h,
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () async {
                    productDetailsController.isVisable.value=true;
                      if(widget.type=="simple") {
                        productDetailsController.variationId.value="";
                        productDetailsController.addToCart(context,
                          widget.id,productDetailsController.productDetailsResponse.value.sku);
                      }else{
                        productDetailsController.addToCart(context,
                            widget.id,productDetailsController.skuProduct.value);
                      }
                  },
                  child: Text(
                    'add_to_cart'.tr(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            )),
            SizedBox(width: 1.h,),
            Expanded(
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5),),
                      border: Border.all(
                        color: MyColors.Dark5,
                        width: 1.0,
                      ),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if(productDetailsController.quantity.value>1) {
                                productDetailsController.quantity.value--;
                              }
                            });
                          },
                          child: Center(child: SvgPicture.asset('assets/mines.svg'))),
                      const Spacer(),
                      Container(
                        color: MyColors.Dark5,
                        width: 0.2.h,
                      ),
                      const Spacer(),
                      Center(
                        child: Text(productDetailsController.quantity.value.toString(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'medium',
                                fontWeight: FontWeight.w500,
                                color: MyColors.MainColor))),
                      const Spacer(),
                      Container(
                        color: MyColors.Dark5,
                        width: 0.2.h,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              productDetailsController.quantity.value++;
                            });
                          },
                          child: Center(child: SvgPicture.asset('assets/add.svg',))),
                      const Spacer(),
                    ],
                  ),
                )),
           /* Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 1.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if(productDetailsController.quantity.value>1) {
                                productDetailsController.quantity.value--;
                              }
                            });
                          },
                          child: Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      topLeft: Radius.circular(5)),
                                  border: Border.all(
                                    color: MyColors.Dark5,
                                    width: 1.0,
                                  ),
                                  color: Colors.white),
                              child: SvgPicture.asset('assets/mines.svg')),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.Dark5,
                                  width: 1.0,
                                ),
                                color: Colors.white),
                            child: Center(
                              child: Text(productDetailsController.quantity.value.toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'medium',
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.MainColor)),
                            )),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              productDetailsController.quantity.value++;
                            });
                          },
                          child: Container(
                              height: 6.h,
                              margin: EdgeInsetsDirectional.only(end: 1.h),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  border: Border.all(
                                    color: MyColors.Dark5,
                                    width: 1.0,
                                  ),
                                  color: Colors.white),
                              child: SvgPicture.asset('assets/add.svg')),
                        ),
                      ),
                    ],
                  ),
                )),*/
            SizedBox(width: 1.h,),
          ],)
            :Expanded(
              child: Container(
                  margin: EdgeInsetsDirectional.only(start: 1.h, end: 1.h, top: 1.h,bottom: 1.h),
                  width: double.infinity,
                  height: 6.h,
                  child: TextButton(
                    style: flatButtonStyle2,
                    onPressed: () async {
                      // Navigator.pushNamed(context, "/Verfiy_code_screen",arguments:PhoneController.text);
                    },
                  child: Text(
                    'cant_add_to_cart'.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  ),
                ),
            ),

          ))
        :Center(
          child: Text("not_available".tr(), style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.SecondryColor),maxLines: 1,),
        ),
      )),
    )
        :Scaffold(
      body: NoIntrnet(),
    );
  }

  Widget appBar(){
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Transform.rotate(
                angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                child: SvgPicture.asset('assets/back.svg',))
        ),
        const Spacer(),
        Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
        const Spacer(),
        Container(
            margin: EdgeInsetsDirectional.only(end: 1.h),
            child: IconButton(
                onPressed: () async{
                  createDynamicLink(
                      true, widget.productId,widget.type);
                },
                icon: const Icon(Icons.share,))
          // SvgPicture.asset(
          //   'assets/love.svg',
          // )),
        ),
      ],
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
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  check();
                  productDetailsController.getDeviceInfo(context);
                  productDetailsController.quantity.value=1;
                  productDetailsController.addedVariableList.clear();
                  productDetailsController.tittleSearch="";
                  productDetailsController.isExiste.value=false;
                  if(widget.type=="simple"){
                    productDetailsController.getHomeCategory(widget.productId,"categories");
                  }else{
                    productDetailsController.getHomeCategory(widget.productId,"categories;variations;variations.attribute.values;variation_options");
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

  Widget Slider(){
    return Container(
      color: MyColors.MainTint6,
      padding: EdgeInsetsDirectional.only(top: 3.5.h),
      child:productDetailsController.galleryList.isEmpty?
      SizedBox(
        height: 29.h,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          height: 29.h,
          width: 45.w,
          productDetailsController.productDetailsResponse.value.image?.original??"",
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) =>
          (loadingProgress == null)
              ? child
              : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
          errorBuilder: (context, error, stackTrace) =>
              Center(child:  SvgPicture.asset('assets/logo_login.svg')),
        ),
      )
     :Column(
        children: [
          CarouselSlider.builder(
            itemCount: productDetailsController.galleryList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsetsDirectional.only(end: 1.h),
                    color: MyColors.MainTint6,
                    child: Image(image: NetworkImage(productDetailsController.galleryList[itemIndex].image),fit: BoxFit.fill,)
                   // const Image(image: AssetImage('assets/book_slider.png'))
                ),
            options: CarouselOptions(
                height: 20.h,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int index, CarouselPageChangedReason reason) => {
                  setState(() => {currentIndex = index})
                }),
          ),
          SizedBox(height: 1.h,),
          DotsIndicator(
            dotsCount: productDetailsController.galleryList.length,
            position: currentIndex.toDouble(),
            decorator: DotsDecorator(
              size:  Size.square(1.h),
              activeSize:  Size(2.h, 1.h),
              activeColor: MyColors.MainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          )
        ],

      ),
    );
  }

  Widget relatedBooks(){
    if(productDetailsController.relatedProductsList.isNotEmpty) {
      return GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (6 / 10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 8,
          ),
          itemCount: productDetailsController.relatedProductsList.length,
          itemBuilder: (context, int index) {
            return RelatedBooksItem(
                relatedProducts: productDetailsController
                    .relatedProductsList[index]
            );
          });
    }else{
      return empty();
    }

  }

  Widget variableSection() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: productDetailsController.variationsList.length,
        itemBuilder: (context, int index) {
          productDetailsController.addedVariableList.add(null);
          return VariableItem(
            variations: productDetailsController.variationsList[index],
            //variationOptions: productDetailsController.variationOptionsList[index],
            indexItem: index,
          );
        }
    );
  }

}
class empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('assets/empty.svg'),
          SizedBox(height: 1.h,),
          Text('there_are_no_related_product'.tr(),
            style: TextStyle(fontSize: 14.sp,
                fontFamily: 'bold',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}