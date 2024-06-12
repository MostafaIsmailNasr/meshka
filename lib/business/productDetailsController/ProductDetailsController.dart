
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../conustant/di.dart';
import '../../conustant/my_colors.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/cartModel/addToCartModel/AddToCartResponse.dart';
import '../../data/model/productDetailsModel/ProductDetailsResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';
import 'package:device_info/device_info.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../ui/screens/successCartDialog/success_cart_dialog.dart';
import '../../ui/screens/successCartDialog/success_cart_sheet.dart';



class ProductDetailsController extends GetxController {
  Repo repo = Repo(WebService());
  var productDetailsResponse = ProductDetailsResponse().obs;
  var addToCartResponse = AddToCartResponse().obs;
  var isLoading = false.obs;
  RxList<dynamic> galleryList=[].obs;
  RxList<dynamic> relatedProductsList=[].obs;
  RxList<dynamic> variationsList=[].obs;
  RxList<dynamic> variationOptionsList=[].obs;
  RxList<dynamic> addedVariableList=[].obs;
  var maxPrice="".obs,minPrice="".obs,variationId="".obs,skuProduct="".obs;
  Rx<bool> isExiste=false.obs;
  var productType="".obs;
  Rx<bool> isVisable = false.obs;

  var tittleSearch="";
  String deviceId="";
  Rx<int> quantity=1.obs;
  var resultCodeProductDetails=0;
  var cartttId;

  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  getHomeCategory(String productId,String type) async {
    isLoading.value = true;
    productDetailsResponse.value = await repo.getProductDetails(productId,type);
    if(resultCodeProductDetails==200){
      galleryList.value=productDetailsResponse.value.gallery??[];
      relatedProductsList.value=productDetailsResponse.value.relatedProducts??[];
      variationsList.value=productDetailsResponse.value.variations??[];
      variationOptionsList.value=productDetailsResponse.value.variationOptions??[];
      maxPrice.value=productDetailsResponse.value.maxPrice.toString();
      minPrice.value=productDetailsResponse.value.minPrice.toString();
      productType.value=productDetailsResponse.value.productType??"";
      isLoading.value = false;
    }
    return productDetailsResponse.value;
  }

  Future<String> getDeviceInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    // Get the device information

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      print("ios");
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? "unknown"; // For iOS
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.fingerprint; // For Android
    }

// Print the deviceId
    print('Device Id: $deviceId');
    return deviceId;
  }

  addToCart(BuildContext context,
      String productId,String sku) async {
    addToCartResponse.value =
    await repo.addToCart(
        deviceId,
        sku,
        quantity.value,
        productId,
        variationId.value,
        sharedPreferencesService.getString('cartId'));
    isVisable.value=false;
    if(addToCartResponse.value.success==true){
      sharedPreferencesService.setString("cartId", addToCartResponse.value.cartId.toString());
      print("pplo "+sharedPreferencesService.getString("cartId"));
       cartttId=sharedPreferencesService.getString("cartId");
      // ignore: use_build_context_synchronously
      showModalBottomSheet<void>(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          backgroundColor: Colors.white,
          builder: (BuildContext context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SuccessCartSheet(addToCartResponse.value.cartId.toString())));
    }else{
      Fluttertoast.showToast(
          msg: 'failed_to_add_product_to_cart'.tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.STATUSEREDColor
      );
    }
    //await updateToken();
  }
}