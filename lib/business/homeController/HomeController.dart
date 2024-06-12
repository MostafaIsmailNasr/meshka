import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../conustant/di.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/categoryProductModel/CategoryProductResponse.dart';

import '../../data/model/home/ImagesModel/ImagesResponse.dart';
import '../../data/model/home/categoryModel/CategoryResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';

class HomeController extends GetxController {
  Repo repo = Repo(WebService());
  var categoryResponse = CategoryResponse().obs;
  var response = CategoryProductResponse().obs;
  var imagesResponse = ImagesResponse().obs;
  var isLoading = false.obs;
  var isLoadingShopCat = false.obs;
  var isLoadingFlash1 = false.obs;
  var isLoadingSProduct = false.obs;
  var isLoadingFProduct = false.obs;
  var isLoadingNewArr = false.obs;
  var isLoadingBrands = false.obs;
  var isLoadingImages = false.obs;

  var streetAddress = ''.obs;
  var countryAddress = ''.obs;
  var tittleAddress = ''.obs;
  var zipAddress = ''.obs;

  var resultCodeCatHome = 0;
  var resultCodeShopCat = 0;
  var resultCodeFlash1=0;
  var resultCodeSProduct=0;
  var resultCodeFProduct=0;
  var resultCodeNewArr=0;
  var resultCodeBrands=0;
  var resultCodeImages=0;
  var userName,emailUser,pic;
  RxList<dynamic> categoryList=[].obs;
  RxList<dynamic> shopCategoryList=[].obs;
  RxList<dynamic> flashSale1List=[].obs;
  RxList<dynamic> onSProductList=[].obs;
  RxList<dynamic> fProductList=[].obs;
  RxList<dynamic> newArrivalList=[].obs;
  RxList<dynamic> brandsList=[].obs;

  var gridBannerLargeImage="";
  RxList<dynamic> gridBannerSList=[].obs;
  RxList<dynamic> promotionBannerList=[].obs;
  RxList<dynamic> vintageDemoBannerList=[].obs;
  RxList<dynamic> exclusiveBlockList=[].obs;

  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();



  getHomeCategory(BuildContext context,String from) async {
    userName=sharedPreferencesService.getString("name");
    emailUser=sharedPreferencesService.getString("email");
    pic=sharedPreferencesService.getString("avatarOriginal");
    isLoading.value = true;
    isLoadingShopCat.value=true;
    categoryResponse.value = await repo.getHomeCategory(from);
    if(resultCodeCatHome==200&&resultCodeShopCat==200){
      categoryList.value=categoryResponse.value.data??[];
      isLoading.value = false;
      shopCategoryList.value=categoryResponse.value.data??[];
      isLoadingShopCat.value=false;
    }
    return categoryResponse.value;
  }

  getHomeData(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String tags) async {
    isLoadingFlash1.value = true;
    isLoadingSProduct.value = true;
    isLoadingFProduct.value = true;
    isLoadingNewArr.value=true;
    response.value = await repo.getFlashSales1(page,slug,sortedBy,orderBy,tags);
    if(resultCodeFlash1==200&&resultCodeSProduct==200&&resultCodeFProduct==200){
      flashSale1List.value=response.value.data??[];
      isLoadingFlash1.value = false;

      onSProductList.value=response.value.data??[];
      isLoadingSProduct.value = false;

      fProductList.value=response.value.data??[];
      isLoadingFProduct.value = false;

      newArrivalList.value=response.value.data??[];
      isLoadingNewArr.value = false;
    }
    return response.value;
  }

  getBrands() async {
    isLoadingBrands.value = true;
    List<dynamic> brandsResp = await repo.getBrands();
    if (resultCodeBrands == 200) {
      isLoadingBrands.value = false;
      brandsList.value = brandsResp??[];
      /*for (var brand in brandsResp) {
        print('Brand ID: ${brand.id}, Name: ${brand.name}');
      }*/
    }
    return brandsResp;
  }

  getHomeImages() async {
    isLoadingImages.value = true;
    List<dynamic> imagesResp = await repo.getHomeImages();
    if (resultCodeImages == 200) {
      isLoadingImages.value = false;
      brandsList.value = imagesResp;
      for (var images in imagesResp) {
        if(images.type=="large"&&images.sectionName=="gridBanner"){
          gridBannerLargeImage=images.image.thumbnail??"";
          print('uuio ${images.image.thumbnail}');
        }
        if(images.type=="small"&&images.sectionName=="gridBanner"){
          gridBannerSList.add(images.image.thumbnail??"");
          print('uuio2 ${gridBannerSList.toString()}');
        }
        if(images.sectionName=="promotionBanner"){
          promotionBannerList.add(images.image.thumbnail??"");
          print('uuio3 ${promotionBannerList.toString()}');
        }
        if(images.sectionName=="vintageDemoBanner"){
          vintageDemoBannerList.add(images.image.thumbnail??"");
          print('uuio4 ${vintageDemoBannerList.toString()}');
        }
        if(images.sectionName=="exclusiveBlock"){
          exclusiveBlockList.add(images.image.thumbnail??"");
          print('uuio5 ${exclusiveBlockList.toString()}');
        }
      }

    }
    return imagesResp;
  }
}