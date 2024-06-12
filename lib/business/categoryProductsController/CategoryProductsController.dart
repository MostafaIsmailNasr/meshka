
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../conustant/di.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/categoryProductModel/CategoryProductResponse.dart';
import '../../data/model/filterModel/BrandsModel/BrandsResponse.dart';
import '../../data/model/home/categoryModel/CategoryResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';

class CategoryProductsController extends GetxController {
  Repo repo = Repo(WebService());
  var categoryProductResponse = CategoryProductResponse().obs;
  var categoryResponse = CategoryResponse().obs;
  var brandsResponse = BrandsResponse().obs;
  List<int> selectedIds = [];
  List<int> selectedIdsBrands = [];


  RxList<dynamic> categoryList=[].obs;
  RxList<dynamic> brandsList=[].obs;
  RxList<dynamic> productCatList=[].obs;
  RxList<dynamic> jsonData=[].obs;
  List<BrandsResponse> brandsResp=[];
  List<String> sendCatList=[];
  List<String> sendBrandList=[];
  List<int> priceList=[];
  var sendCatName="";
  var sendBrandName="";
  var sendPrice="";
  var overThou="";

  var isLoading = false.obs;
  var isLoadingCat = false.obs;
  var isLoadingBrands = false.obs;
  var isLoading2=false.obs;
  var isLoadingMore=false;
  var isVisable=false.obs;

  var resultCodeProduct = 0;
  var resultCodeCatHome = 0;
  var resultCodeBrands = 0;
  var sortedBy="";
  var orderBy="";
  String slug="";
  String tags="";
  bool isCheckedPrice50 = false;
  bool isCheckedPrice100 = false;
  bool isCheckedPrice150 = false;
  bool isCheckedPrice200 = false;
  bool isCheckedPrice300 = false;
  bool isCheckedPrice500 = false;
  bool isCheckedPrice1000 = false;
  bool isCheckedPrice1100 = false;
  int page=1;
  final scroll=ScrollController();

  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();



  Future<void> scrollListener()async{
    if(isLoadingMore)return;
    if(scroll.position.pixels == scroll.position.maxScrollExtent){
      isLoadingMore=true;
      page=page+1;
      await getCategoryProduct(page,
          "categories.slug:$slug;status:publish",
          "ASC","created_at",sendCatName,sendBrandName,sendPrice,tags);
      isLoadingMore=false;
    }
  }

  getCategoryProduct(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String category,
      String brand,
      String price,
      String tags) async {

    if(page==1){
      isLoading.value = true;
    }else{
      isLoading2.value = true;
    }

    CategoryProduct? loadingItem;

    if (categoryProductResponse.value.currentPage != categoryProductResponse.value.lastPage) {
      loadingItem = CategoryProduct(name: "loading");
      isVisable.value=true;
      productCatList.add(loadingItem!);
    }

    var response = await repo.getCategoryProducts(
        page,
        slug,
        sortedBy,
        orderBy,
        category,
        brand,
        price,
        tags);

    if (response != null) {
      isVisable.value=false;
      categoryProductResponse.value = response;
      List<CategoryProduct> newData = response.data ?? [];

      if (loadingItem != null) {
        productCatList.remove(loadingItem);
      }

      if (page == 1) {
        productCatList.assignAll(newData);
      } else {
        productCatList.addAll(newData);
      }

      isLoading.value = false;
      isLoading2.value = false;
      return response;
    } else {
      isLoading.value = false;
      isLoading2.value = false;
      return response;
    }
  }

  getCategories(String from) async {
    isLoadingCat.value = true;
    categoryResponse.value = await repo.getHomeCategory(from);
    if(resultCodeCatHome==200){
      isLoadingCat.value = false;
      categoryList.value=categoryResponse.value.data??[];
    }
    return categoryResponse.value;
  }

  getBrands() async {
    isLoadingBrands.value = true;
    List<dynamic> brandsResp = await repo.getBrands();
    if (resultCodeBrands == 200) {
      isLoadingBrands.value = false;
      brandsList.value = brandsResp;
      /*// for (var brand in brandsResp) {
      //   print('Brand ID: ${brand.id}, Name: ${brand.name}');
      // }*/
    }
    return brandsResp;
  }
}
