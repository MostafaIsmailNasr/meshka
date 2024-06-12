import 'package:dio/dio.dart' as dio1;
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';

import '../../business/auth/loginController/LoginController.dart';
import '../../business/auth/registerController/RegisterController.dart';
import '../../business/categoryProductsController/CategoryProductsController.dart';
import '../../business/createOrderController/CreateOrderController.dart';
import '../../business/homeController/HomeController.dart';
import '../../business/more/addressController/AddressController.dart';
import '../../business/more/profileController/ProfileController.dart';
import '../../business/orderController/OrderController.dart';
import '../../business/productDetailsController/ProductDetailsController.dart';
import '../../business/searchController/SearchController.dart';
import '../../conustant/di.dart';
import '../../conustant/my_colors.dart';
import '../../conustant/shared_preference_serv.dart';
import '../model/auth/LoginModel/LoginResponse.dart';
import '../model/auth/RegisterModel/RegisterResponse.dart';
import '../model/auth/UserDataModel/UserDataResponse.dart';
import '../model/cartModel/addToCartModel/AddToCartResponse.dart';
import '../model/cartModel/cartListModel/CartListResponse.dart';
import '../model/cartModel/updateCartModel/UpdateCartResponse.dart';
import '../model/categoryProductModel/CategoryProductResponse.dart';
import '../model/checkoutModel/CheckoutResponse.dart';
import '../model/couponModel/CouponResponse.dart';
import '../model/createOrderModel/CreateOrderResponse.dart';
import '../model/filterModel/BrandsModel/BrandsResponse.dart';
import '../model/home/ImagesModel/ImagesResponse.dart';
import '../model/home/categoryModel/CategoryResponse.dart';
import '../model/listOrderModel/ListOrderResponse.dart';
import '../model/more/addressModel/AddressResponse.dart';
import '../model/more/profileModel/UpdateProfileResponse.dart';
import '../model/more/profileModel/imageModel/ImageResponse.dart';
import '../model/orderDetailsModel/OrderDetailsResponse.dart';
import '../model/productDetailsModel/ProductDetailsResponse.dart';
import '../model/searchModel/SearchResponse.dart';
import '../model/settingModel/SettingResponse.dart';
import '../model/userIdModel/UserIdResponse.dart';
class WebService {
  late dio1.Dio dio;
  late dio1.BaseOptions options;
  var baseUrl = "https://meshkatbooks.mtjrsahl-ksa.com/backend/public/";
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  // var language;
  // var userToken;

  WebService() {
    options = dio1.BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 100 * 1000),
      receiveTimeout: Duration(milliseconds: 100 * 1000),
    );
    dio = dio1.Dio(options);
  }

  void handleError(DioException e) {
    String message = '';

    if (e.error is SocketException) {
      message = 'No internet connection';
    } else if (e.response != null) {
      if (e.response?.statusCode == 422) {
        dynamic responseData = e.response!.data['message'];
        if (responseData is List) {
          if (responseData.isNotEmpty) {
            message = responseData[0];
          }
        } else if (responseData is String) {
          message = responseData;
        } else {
          message = 'An error occurred2';
        }
      } else {
        message = '${e.response}';
      }
    } else if (e.type == DioExceptionType.cancel) {
      message = 'Request was canceled';
    } else {
      message = 'An error occurred1';
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.STATUSEREDColor
    );
    print("jkjkjkjik" + message);
  }

  void handleRegisterError(DioException e) {
    String message = '';

    if (e.error is SocketException) {
      message = 'No internet connection';
    } else if (e.response != null) {
      if (e.response?.statusCode == 422) {
        dynamic responseData = e.response!.data['email'];
        if (responseData is List) {
          if (responseData.isNotEmpty) {
            message = responseData[0];
          }
        } else if (responseData is String) {
          message = responseData;
        } else {
          message = 'An error occurred2';
        }
      } else {
        message = '${e.response}';
      }
    } else if (e.type == DioExceptionType.cancel) {
      message = 'Request was canceled';
    } else {
      message = 'An error occurred1';
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.STATUSEREDColor
    );
    print("jkjkjkjik" + message);
  }

  Future<RegisterResponse> Register(
      String name,
      String email,
      String pass)async{
    final registerController = Get.put(RegisterController());
    try {
      var LoginUrl="register";
      print(LoginUrl);
      var params={
        'name': name,
        'email': email,
        'password': pass,
        'permission': "customer",
      };
      print(options.baseUrl+LoginUrl+params.toString());
      dio1.Response response = await dio.post(LoginUrl, data: params,
          options: dio1.Options(headers: {
          //"authorization": "Bearer ${token}",
        "Accept":"application/json",
          "content-type": "application/json",
          "content-length": 83
        },));
      registerController.resultCodeRegister=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+RegisterResponse.fromJson(response.data).toString());
        return RegisterResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return RegisterResponse();
      }
    }on DioException catch(e){
      handleRegisterError(e);
      return RegisterResponse();
    }
  }

  Future<UserDataResponse> getUserData()async{
    final registerController = Get.put(RegisterController());
    final loginController = Get.put(LoginController());
    final addressController = Get.put(AddressController());
    final createOrderController = Get.put(CreateOrderController());
    try {
      var Url="me";
      print(Url);
      print(options.baseUrl+Url);
      dio1.Response response = await dio.get(Url, //data: params,
          options: dio1.Options(
            headers: {
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}",
            },
          )
      );
      print(response);
      registerController.resultCodeUserData=response.statusCode??0;
      addressController.resultCodeListAddress=response.statusCode??0;
      createOrderController.resultCodeListAddress=response.statusCode??0;
      loginController.resultCodeUserData=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+UserDataResponse.fromJson(response.data).toString());
        return UserDataResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UserDataResponse();
      }
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return UserDataResponse();
    }
  }

  Future<LoginResponse> login(
      String email,
      String pass)async{
    final loginController = Get.put(LoginController());
    try {
      var LoginUrl="token";
      print(LoginUrl);
      var params={
        'email': email,
        'password': pass,
      };
      print(options.baseUrl+LoginUrl+params.toString());
      dio1.Response response = await dio.post(LoginUrl, data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "content-length": 83
            },
          ));
      print(response);
      loginController.resultCodeLogin=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+RegisterResponse.fromJson(response.data).toString());
        return LoginResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return LoginResponse();
      }
    }on DioException catch(e){
      return LoginResponse();
    }
  }

  Future<CategoryResponse> getHomeCategory(String from)async{
    final homeController = Get.put(HomeController());
    final categoryProductsController = Get.put(CategoryProductsController());
    try {
      if(from=="home"){
        var Url="categories/?";
        var params={
          'in_home':"1",
          'limit':10
        };
        print(options.baseUrl+Url+params.toString());
        dio1.Response response = await dio.get(Url, queryParameters: params,
            options: dio1.Options(
              headers: {
                "Accept":"application/json",
                "content-type": "application/json",
              },
            ));
        print(response);
        homeController.resultCodeCatHome=response.statusCode??0;
        if(response.statusCode==200){
          print("klkl"+CategoryResponse.fromJson(response.data).toString());
          return CategoryResponse.fromJson(response.data);
        }else{
          print("klkl121"+response.statusMessage.toString());
          return CategoryResponse();
        }
      }
      else if(from=="filter"){
        var Url="categories/";
        print(options.baseUrl+Url);
        dio1.Response response = await dio.get(Url,
            options: dio1.Options(
              headers: {
                "Accept":"application/json",
                "content-type": "application/json",
              },
            ));
        print(response);
        categoryProductsController.resultCodeCatHome=response.statusCode??0;
        if(response.statusCode==200){
          print("klkl"+CategoryResponse.fromJson(response.data).toString());
          return CategoryResponse.fromJson(response.data);
        }else{
          print("klkl121"+response.statusMessage.toString());
          return CategoryResponse();
        }
      }
      else if(from=="shopCat"){
        var Url="categories/?";
        var params={
          'limit':10
        };
        print(options.baseUrl+Url+params.toString());
        dio1.Response response = await dio.get(Url, queryParameters: params,
            options: dio1.Options(
              headers: {
                "Accept":"application/json",
                "content-type": "application/json",
              },
            ));
        print(response);
        homeController.resultCodeShopCat=response.statusCode??0;
        if(response.statusCode==200){
          print("klkl"+CategoryResponse.fromJson(response.data).toString());
          return CategoryResponse.fromJson(response.data);
        }else{
          print("klkl121"+response.statusMessage.toString());
          return CategoryResponse();
        }
      }
      else{
        var Url="categories/";
        print(options.baseUrl+Url);
        dio1.Response response = await dio.get(Url,
            options: dio1.Options(
              headers: {
                "Accept":"application/json",
                "content-type": "application/json",
              },
            ));
        print(response);
        homeController.resultCodeCatHome=response.statusCode??0;
        if(response.statusCode==200){
          print("klkl"+CategoryResponse.fromJson(response.data).toString());
          return CategoryResponse.fromJson(response.data);
        }else{
          print("klkl121"+response.statusMessage.toString());
          return CategoryResponse();
        }
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CategoryResponse();
    }
  }

  Future<CategoryProductResponse> getCategoryProducts(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String category,
      String brand,
      String price,
      String tags)async{
    final categoryProductsController = Get.put(CategoryProductsController());
    try {
      var Url="products?";
      var params={
        'search':slug,
        'sortedBy':sortedBy,
        'limit':10,
        'language':sharedPreferencesService.getString("lang"),
        'page': page,
        'searchJoin':"and",
        'orderBy':orderBy,
        'category':category,
        'type':brand,
        'max_price': price,
        'tags':tags
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url, queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      categoryProductsController.resultCodeProduct=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+CategoryProductResponse.fromJson(response.data).toString());
        return CategoryProductResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return CategoryProductResponse();
      }
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CategoryProductResponse();
    }
  }

  Future<dynamic> getBrands()async{
    final categoryProductsController = Get.put(CategoryProductsController());
    final homeController = Get.put(HomeController());
    try {
      var Url="types/";
      print(options.baseUrl+Url);
      dio1.Response response = await dio.get(Url,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      categoryProductsController.resultCodeBrands=response.statusCode??0;
      homeController.resultCodeBrands=response.statusCode??0;

      if (response.statusCode == 200) {
        List<dynamic> brandsList = response.data
            .map((jsonItem) => BrandsResponse.fromJson(jsonItem))
            .toList();
        //categoryProductsController.jsonData.value = response.data;
        return brandsList;
      } else {
        print("klkl121" + response.statusMessage.toString());
        return [];
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return [];
    }
  }

  Future<CategoryProductResponse> getFlashSales1(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String tags
      )async{
    final homeController = Get.put(HomeController());
    try {
      var Url="products?";
      var params={
        'search':slug,
        'sortedBy':sortedBy,
        'limit':10,
        'language':sharedPreferencesService.getString("lang"),
        'page': page,
        'searchJoin':"and",
        'orderBy':orderBy,
        'tags': tags
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url, queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      homeController.resultCodeFlash1=response.statusCode??0;
      homeController.resultCodeSProduct=response.statusCode??0;
      homeController.resultCodeFProduct=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+CategoryProductResponse.fromJson(response.data).toString());
        return CategoryProductResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return CategoryProductResponse();
      }
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CategoryProductResponse();
    }
  }

  Future<ProductDetailsResponse> getProductDetails(String productId,String type)async{

    final productDetailsController = Get.put(ProductDetailsController());
    try {
      var Url="products/$productId?";
      var params={
        'with':type,//"categories",
        'searchJoin':"and",
        'language':sharedPreferencesService.getString("lang")
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      productDetailsController.resultCodeProductDetails=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+ProductDetailsResponse.fromJson(response.data).toString());
        return ProductDetailsResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return ProductDetailsResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return ProductDetailsResponse();
    }
  }

  Future<dynamic> getHomeImages()async{

    final homeController = Get.put(HomeController());
    try {
      var Url="theme/items?";
      var params={
        'language':sharedPreferencesService.getString("lang")
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      homeController.resultCodeImages=response.statusCode??0;
      if (response.statusCode == 200) {
        List<dynamic> imagesList = response.data
            .map((jsonItem) => ImagesResponse.fromJson(jsonItem))
            .toList();
        //categoryProductsController.jsonData.value = response.data;
        return imagesList;
      } else {
        print("klkl121" + response.statusMessage.toString());
        return [];
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return [];
    }
  }

  Future<SearchResponse> search(String word,int page)async{

    final searchController = Get.put(SearchProductController());
    try {
      var Url="products?";
      var params={
        'search':"name:$word;status:publish",
        'searchJoin':"and",
        'sortedBy':"DESC",
        'language':sharedPreferencesService.getString("lang"),
        'orderBy':"created_at",
        'text':word,
        'limit':10,
        'page':page,
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"content-length": 83
            },
          )
      );
      print(response);
      searchController.resultCodeSearch=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+SearchResponse.fromJson(response.data).toString());
        return SearchResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return SearchResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return SearchResponse();
    }
  }

  Future<AddressResponse> addAddress(
      String tittle,
      String state,
      String zip,
      String city,
      String streetAddress,
      bool defu)async{

    final addressController = Get.put(AddressController());
    try {
      var Url="address";
      var params={
        "title": tittle,
        "type": "shipping",
        "default": defu,
        "customer_id": sharedPreferencesService.getInt("id"),
        "address": {
          "state": state,
          "zip": zip,
          "city": city,
          "street_address": streetAddress
        }
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      addressController.resultCodeAddAddress=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+AddressResponse.fromJson(response.data).toString());
        return AddressResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return AddressResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return AddressResponse();
    }
  }

  Future<dynamic> editeAddress(
      int id,
      String tittle,
      String state,
      String zip,
      String city,
      String streetAddress,bool def)async{

    final addressController = Get.put(AddressController());
    try {
      var Url="address/$id";
      var params={
        "title": tittle,
        "type": "shipping",
        "default": def,
        "customer_id": sharedPreferencesService.getInt("id"),
        "address": {
          "state": state,
          "zip": zip,
          "city": city,
          "street_address": streetAddress
        }
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.put(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      addressController.resultCodeEditeAddress=response.statusCode??0;
      if(response.statusCode==200){
        //print("klkl"+AddressResponse.fromJson(response.data).toString());
       // return AddressResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        //return AddressResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      //return AddressResponse();
    }
  }

  Future<dynamic> deleteAddress(int id)async{
    final addressController = Get.put(AddressController());
    try {
      var Url="address/$id";
      print(Url);
      print(options.baseUrl+Url);
      dio1.Response response = await dio.delete(Url,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
            },
          )
      );
      print(response);
      addressController.resultCodeDeleteAddress=response.statusCode??0;
      if(response.statusCode==200){
        //print("klkl"+AddressResponse.fromJson(response.data).toString());
        // return AddressResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        //return AddressResponse();
      }
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      //return AddressResponse();
    }
  }


  Future<dynamic> uploadImg(File? Img)async{
    final profileController = Get.put(ProfileController());
    try {
      var Url="attachments";
      print(Url);
      dio1.FormData formData=dio1.FormData();
      if(Img!=null) {

        // //[4] ADD IMAGE TO UPLOAD
        var file = await dio1.MultipartFile.fromFile(Img.path,
            filename: basename(Img.path),
            contentType: MediaType("attachment[0]", "title.png"));
        formData.files.add(MapEntry('attachment[0]',
          await MultipartFile.fromFile(Img.path, filename: 'attachment0.jpg',),
        ));
        // formData.files.add(MapEntry('attachment[0]', file));
      }
      print(options.baseUrl+Url+formData.fields.toString());
      dio1.Response response = await dio.post(Url,data: formData,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
            },
          ));
      print(response);
      profileController.resultCodeUploadImg=response.statusCode??0;
      if (response.statusCode == 200) {
        List<dynamic> imgList = response.data
            .map((jsonItem) => ImageResponse.fromJson(jsonItem))
            .toList();
        //categoryProductsController.jsonData.value = response.data;
        return imgList;
      } else {
        print("klkl121" + response.statusMessage.toString());
        return [];
      }
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return [];
    }
  }

  Future<UpdateProfileResponse> updateProfile(
      String name,
      String bio,
      String contact,
      String email)async{

    final profileController=Get.put(ProfileController());
    try {
      var Url="users/${sharedPreferencesService.getInt("id")}";
      var params=
        {
          "name": name,
          "email": email,
          "profile": {
            "bio": bio,
            "customer_id": sharedPreferencesService.getInt("id"),
            "contact": contact,
            "socials": [
              {
                "type": "Twitter",
                "link": "twitter.com"
              }
            ],
            "avatar": {
              "id": sharedPreferencesService.getString("avatarId"),
              "original": sharedPreferencesService.getString("avatarOriginal"),
              "thumbnail": sharedPreferencesService.getString("avatarThumbnail")
            }
          },
          // "address": [
          //   {
          //     "title": "address",
          //     "type": "shipping",
          //     "default": false,
          //     "customer_id":  sharedPreferencesService.getInt("id"),
          //     "address": {
          //       "country": "",
          //       "state": "",
          //       "zip": "",
          //       "city": "",
          //       "street_address": ""
          //     }
          //   }
          // ]
        };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.put(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      profileController.resultCodeUpdateProfile=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+UpdateProfileResponse.fromJson(response.data).toString());
        return UpdateProfileResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UpdateProfileResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleRegisterError(e);
      return UpdateProfileResponse();
    }
  }

  Future<ListOrderResponse> getOrder(int page)async{

    final orderController = Get.put(OrderController());
    try {
      var Url="orders?";
      var params={
        'language':sharedPreferencesService.getString("lang"),
        'page': page
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      orderController.resultCodeOrders=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+ListOrderResponse.fromJson(response.data).toString());
        return ListOrderResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return ListOrderResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return ListOrderResponse();
    }
  }

  Future<OrderDetailsResponse> getOrderDetails(String orderId)async{

    final orderController = Get.put(OrderController());
    try {
      var Url="orders/$orderId?";
      var params={
        'language':sharedPreferencesService.getString("lang"),
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      orderController.resultCodeOrdersDetails=response.statusCode??0;
      if(response.statusCode==200){
        print("klkl"+OrderDetailsResponse.fromJson(response.data).toString());
        return OrderDetailsResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return OrderDetailsResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return OrderDetailsResponse();
    }
  }

  Future<AddToCartResponse> addToCart(
      String deviceId,
      String sku,
      int quantity,
      String productId,
      String variationId,
      String cartId)async{
    try {
      var params={};
      var LoginUrl="carts/add";
      print(LoginUrl);
      if(sharedPreferencesService.getString('cartId')!="null"){
        params={
          'user_id': sharedPreferencesService.getInt('id'),
          'type_device':"Mobile",
          'sku':sku,
          'quantity':quantity,
          'productId':productId,
          'variationId':variationId,
          'cart_id':cartId
        };
      }else{
        params={
          // 'user_id': sharedPreferencesService.getInt('id'),
          'device_id': deviceId,
          'type_device':"Mobile",
          'sku':sku,
          'quantity':quantity,
          'productId':productId,
          'variationId':variationId,
        };
      }
      print(options.baseUrl+LoginUrl+params.toString());
      dio1.Response response = await dio.post(LoginUrl, data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "content-length": 83
            },
          ));
      print(response);
      if(response.statusCode==200){
        print("klkl"+AddToCartResponse.fromJson(response.data).toString());
        return AddToCartResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return AddToCartResponse();
      }
    }on DioException catch(e){
      handleError(e);
      return AddToCartResponse();
    }
  }

  Future<UpdateCartResponse> updateCart(
      String sku,
      int quantity,
      String cartId,
      String productId)async{
    try {
      var url="carts/update/quantity";
      print(url);
      var params={
          'sku':sku,
          'quantity':quantity,
          'cart_id':cartId,
          'language':sharedPreferencesService.getString("lang"),
          'product_id': productId,
        };

      print(options.baseUrl+url+params.toString());
      dio1.Response response = await dio.put(url, data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "content-length": 83,
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
            },
          ));
      print(response);
      if(response.statusCode==200){
        print("klkl"+UpdateCartResponse.fromJson(response.data).toString());
        return UpdateCartResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UpdateCartResponse();
      }
    }on DioException catch(e){
      handleError(e);
      return UpdateCartResponse();
    }
  }

  Future<UpdateCartResponse> deleteCartItem(
      String productId,
      String cartId)async{
    try {
      var url="carts/item/delete";
      print(url);
      var params={
        'productId':productId,
        'cart_id':cartId,
      };
      print(options.baseUrl+url+params.toString());
      dio1.Response response = await dio.delete(url, data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "content-length": 83,
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
            },
          ));
      print(response);
      if(response.statusCode==200){
        print("klkl"+UpdateCartResponse.fromJson(response.data).toString());
        return UpdateCartResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UpdateCartResponse();
      }
    }on DioException catch(e){
      handleError(e);
      return UpdateCartResponse();
    }
  }

  Future<UpdateCartResponse> deleteCart(
      String cartId)async{
    try {
      var url="carts/delete";
      print(url);
      var params={
        'cart_id':cartId,
      };
      print(options.baseUrl+url+params.toString());
      dio1.Response response = await dio.delete(url, data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "content-length": 83,
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
            },
          ));
      print(response);
      if(response.statusCode==200){
        print("klkl"+UpdateCartResponse.fromJson(response.data).toString());
        return UpdateCartResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UpdateCartResponse();
      }
    }on DioException catch(e){
      handleError(e);
      return UpdateCartResponse();
    }
  }

  Future<CartListResponse> getCartList(String cartId)async{
    try {
      var Url="carts?";
      var params={
        'cart_id':cartId,
        'language':sharedPreferencesService.getString("lang"),
      };

      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
               "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      return CartListResponse.fromJson(response.data);
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CartListResponse();
    }
  }

  Future<UserIdResponse> updateUserId(
      String cartId,
      String userId,
      )async{
    try {
      var Url="carts/update/user";
      var params={
        "cart_id": cartId,
        "user_id": userId,
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      if(response.statusCode==200){
        print("klkl"+UserIdResponse.fromJson(response.data).toString());
        return UserIdResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return UserIdResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return UserIdResponse();
    }
  }

  Future<SettingResponse> getSetting()async{
    final createOrderController = Get.put(CreateOrderController());
    try {
      var Url="settings?";
      var params={
        'language':sharedPreferencesService.getString("lang"),
      };

      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.get(Url,queryParameters: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      createOrderController.resultCodeSetting=response.statusCode??0;
      print(response);
      return SettingResponse.fromJson(response.data);
    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return SettingResponse();
    }
  }

  Future<CheckoutResponse> checkout(
      List productList,
      String amount,
      String couponId,
      String discount,
      String paidTotal,
      String salesTax,
      String deliveryFee,
      String total,
      String deliveryTime,
      String customerContact,
      String paymentGateway,
      String zip,
      String city,
      String state,
      String country,
      String streetAddress,
      )async{
    final createOrderController = Get.put(CreateOrderController());
    try {
      var Url="orders/checkout/verify";
      var params={
        "products": productList,
        "amount": amount,
        "coupon_id": couponId,
        "discount": discount,
        "paid_total": paidTotal,
        "sales_tax": salesTax,
        "delivery_fee": deliveryFee,
        "total": total,
        "delivery_time": deliveryTime,
        "customer_contact": customerContact,
        "payment_gateway": paymentGateway,
        "shipping_address": {
          "zip": zip,
          "city": city,
          "state": state,
          "country": country,
          "street_address": streetAddress
        },
        'language':sharedPreferencesService.getString("lang")
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              //"authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      createOrderController.resultCodeCheckOut=response.statusCode??0;
      print(response);
      if(response.statusCode==200){
        print("klkl"+CheckoutResponse.fromJson(response.data).toString());
        return CheckoutResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return CheckoutResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CheckoutResponse();
    }
  }

  Future<CouponResponse> validateCoupon(
      String code,
      String total,
      )async{
    try {
      var Url="coupons/verify";
      var params={
        "code": code,
        "sub_total": total,
      };
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      print(response);
      if(response.statusCode==200){
        print("klkl"+CouponResponse.fromJson(response.data).toString());
        return CouponResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return CouponResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CouponResponse();
    }
  }

  Future<CreateOrderResponse> createOrder(
      List productList,
      String amount,
      String salesTax,
      String couponId,
      String paidTotal,
      String total,
      String deliveryTime,
      String customerContact,
      String paymentGateway,
      String zip,
      String city,
      String state,
      String country,
      String streetAddress,
      )async{
    final createOrderController = Get.put(CreateOrderController());
    var params={};
    try {
      var Url="orders";
      if(couponId!="null") {
        params = {
          "products": productList,
          "status": 1,
          "amount": amount,
          "sales_tax": salesTax,
          "coupon_id": couponId,
          "paid_total": paidTotal,
          "total": total,
          "delivery_time": deliveryTime,
          "customer_contact": customerContact,
          "payment_gateway": paymentGateway,
          "shipping_address": {
            "zip": zip,
            "city": city,
            "state": state,
            "country": country,
            "street_address": streetAddress
          },
          'language': sharedPreferencesService.getString("lang")
        };
      }else{
        params = {
          "products": productList,
          "status": 1,
          "amount": amount,
          "sales_tax": salesTax,
          "paid_total": paidTotal,
          "total": total,
          "delivery_time": deliveryTime,
          "customer_contact": customerContact,
          "payment_gateway": paymentGateway,
          "shipping_address": {
            "zip": zip,
            "city": city,
            "state": state,
            "country": country,
            "street_address": streetAddress
          },
          'language': sharedPreferencesService.getString("lang")
        };
      }
      print(options.baseUrl+Url+params.toString());
      dio1.Response response = await dio.post(Url,data: params,
          options: dio1.Options(
            headers: {
              "Accept":"application/json",
              "content-type": "application/json",
              "authorization": "Bearer ${sharedPreferencesService.getString("token")}"
              //"content-length": 83
            },
          )
      );
      createOrderController.resultCodeCreateOrder=response.statusCode??0;
      print(response);
      if(response.statusCode==201){
        print("klkl"+CreateOrderResponse.fromJson(response.data).toString());
        return CreateOrderResponse.fromJson(response.data);
      }else{
        print("klkl121"+response.statusMessage.toString());
        return CreateOrderResponse();
      }

    }on DioException catch(e){
      print(e.toString());
      handleError(e);
      return CreateOrderResponse();
    }
  }
}