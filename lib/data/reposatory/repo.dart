import 'dart:io';

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
import '../web_service/WebService.dart';

class Repo {
  WebService webService;
  Repo(this.webService);

  Future<RegisterResponse> Register(
      String name,
      String email,
      String pass)async{
    final register=await webService.Register(name,email,pass);
    return register;
  }

  Future<UserDataResponse> getUserData()async{
    final userData=await webService.getUserData();
    return userData;
  }

  Future<LoginResponse> login(
      String email,
      String pass)async{
    final login=await webService.login(email,pass);
    return login;
  }

  Future<CategoryResponse> getHomeCategory(String from)async{
    final category=await webService.getHomeCategory(from);
    return category;
  }

  Future<CategoryProductResponse> getCategoryProducts(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String category,
      String brand,
      String price,
      String tags
      )async{
    final product=await webService.getCategoryProducts(
        page,
        slug,
        sortedBy,
        orderBy,
        category,
        brand,
        price,
        tags);
    return product;
  }

  Future<dynamic> getBrands()async{
    final brands=await webService.getBrands();
    return brands;
  }

  Future<dynamic> getHomeImages()async{
    final homeImages=await webService.getHomeImages();
    return homeImages;
  }

  Future<CategoryProductResponse> getFlashSales1(
      int page,
      String slug,
      String sortedBy,
      String orderBy,
      String tags
      )async{
    final flashSales1=await webService.getFlashSales1(page, slug, sortedBy, orderBy, tags);
    return flashSales1;
  }

  Future<ProductDetailsResponse> getProductDetails(String productId,String type)async{
    final productDetails=await webService.getProductDetails(productId,type);
    return productDetails;
  }

  Future<SearchResponse> search(String word,int page)async{
    final productSearch=await webService.search(word,page);
    return productSearch;
  }

  Future<AddressResponse> addAddress(
      String tittle,
      String state,
      String zip,
      String city,
      String streetAddress,bool defu)async{
    final addAddress=await webService.addAddress(tittle,state,zip,city,streetAddress,defu);
    return addAddress;
  }

  Future<dynamic> editeAddress(
      int id,
      String tittle,
      String state,
      String zip,
      String city,
      String streetAddress,bool def)async{
    final editAddress=await webService.editeAddress(id,tittle,state,zip,city,streetAddress,def);
    return editAddress;
  }

  Future<dynamic> deleteAddress(int id)async{
    final delete=await webService.deleteAddress(id);
    return delete;
  }

  Future<dynamic> uploadImg(File? Img)async{
    final img=await webService.uploadImg(Img);
    return img;
  }

  Future<UpdateProfileResponse> updateProfile(
      String name,
      String bio,
      String contact,
      String email)async{
    final profile=await webService.updateProfile(name,bio,contact,email);
    return profile;
  }

  Future<ListOrderResponse> getOrder(int page)async{
    final orders=await webService.getOrder(page);
    return orders;
  }

  Future<OrderDetailsResponse> getOrderDetails(String orderId)async{
    final ordersDetails=await webService.getOrderDetails(orderId);
    return ordersDetails;
  }

  Future<AddToCartResponse> addToCart(
      String deviceId,
      String sku,
      int quantity,
      String productId,
      String variationId,
      String cartId)async{
    final cart=await webService.addToCart(deviceId,sku,quantity,productId,variationId,cartId);
    return cart;
  }

  Future<UpdateCartResponse> updateCart(
      String sku,
      int quantity,
      String cartId,
      String productId)async{
    final cart=await webService.updateCart(sku,quantity,cartId,productId);
    return cart;
  }

  Future<UpdateCartResponse> deleteCartItem(
      String productId,
      String cartId)async{
    final deleteCartItem=await webService.deleteCartItem(productId,cartId);
    return deleteCartItem;
  }

  Future<UpdateCartResponse> deleteCart(
      String cartId)async{
    final deleteCart=await webService.deleteCart(cartId);
    return deleteCart;
  }

  Future<CartListResponse> getCartList(String cartId)async{
    final cartList=await webService.getCartList(cartId);
    return cartList;
  }

  Future<UserIdResponse> updateUserId(
      String cartId,
      String userId,
      )async{
    final updateUserId=await webService.updateUserId(cartId,userId);
    return updateUserId;
  }

  Future<SettingResponse> getSetting()async{
    final setting=await webService.getSetting();
    return setting;
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
    final check=await webService.checkout(
        productList,
        amount,
        couponId,
        discount,
        paidTotal,
        salesTax,
        deliveryFee,
        total,
        deliveryTime,
        customerContact,
        paymentGateway,
        zip,
        city,
        state,
        country,
        streetAddress);
    return check;
  }

  Future<CouponResponse> validateCoupon(
      String code,
      String total,
      )async{
    final coupon=await webService.validateCoupon(code, total);
    return coupon;
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
    final createOrder=await webService.createOrder(
       productList,
       amount,
       salesTax,
       couponId,
       paidTotal,
       total,
       deliveryTime,
       customerContact,
       paymentGateway,
       zip,
       city,
       state,
       country,
       streetAddress,);
    return createOrder;
  }
}