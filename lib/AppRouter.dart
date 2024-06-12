import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mashkah_library/ui/screens/auth/intro/into_slider_screen.dart';
import 'package:mashkah_library/ui/screens/auth/login/login_screen.dart';
import 'package:mashkah_library/ui/screens/auth/register/register_screen.dart';
import 'package:mashkah_library/ui/screens/auth/splash/splash_screen.dart';
import 'package:mashkah_library/ui/screens/auth/verfiyCode/Verfiy_code_screen.dart';
import 'package:mashkah_library/ui/screens/autherDetails/auther_details_screen.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/buttom_navagation_page.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/cart/cart_screen.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/categories/categories_screen.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/home/home_screen.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/postsTweet/postDetails/post_details_screen.dart';
import 'package:mashkah_library/ui/screens/categoryDetails/category_details_screen.dart';
import 'package:mashkah_library/ui/screens/createOrder/create_order_screen.dart';
import 'package:mashkah_library/ui/screens/createOrder/successDialog/success_dialog_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/aboutApp/about_app_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/faqs/faqs_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/myLocation/my_location_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/myOrders/my_orders_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/profile/profile_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/profile/updatePhone/change_phone_number_screen.dart';
import 'package:mashkah_library/ui/screens/morePages/profile/updatePhone/success_update_phone_dialog.dart';
import 'package:mashkah_library/ui/screens/morePages/profile/updatePhone/verfiy_code_update_screen.dart';
import 'package:mashkah_library/ui/screens/notification/notification_screen.dart';
import 'package:mashkah_library/ui/screens/orderDetails/order_details_screen.dart';
import 'package:mashkah_library/ui/screens/productDetails/product_details_screen.dart';
import 'package:mashkah_library/ui/screens/search/search_screen.dart';

import 'data/model/createOrderModel/CreateOrderResponse.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case'/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case'/into_slider_screen':
        return MaterialPageRoute(builder: (_) => IntroSliderScreen());
      case'/Login_screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case'/register_screen':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case'/Verfiy_code_screen':
        final code=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerfiyCodeScreen(phone: code,));
      case'/home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case'/buttom_navagation_screen':
        int index=settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ButtomNavagationPage(index,));
      case'/product_details_screen':
        final productId=settings.arguments as String;
        final type=settings.arguments as String;
        final id=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(productId: productId,type: type,id: id,));
      case'/category_details_screen':
        final slug=settings.arguments as String;
        final name=settings.arguments as String;
        final tags=settings.arguments as String;
        final from=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryDetailsScreen(slug: slug,name: name,tags: tags,from: from,));
      case'/auther_details_screen':
        return MaterialPageRoute(builder: (_) => AutherDetailsScreen());
      case'/search_screen':
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case'/notification_screen':
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case'/create_order_screen':
        return MaterialPageRoute(builder: (_) => CreateOrderScreen());
      case'/success_dialog_screen':
        CreateOrderResponse id=settings.arguments as CreateOrderResponse;
        return MaterialPageRoute(builder: (_) => SuccessDialogScreen(id));
      case'/order_details_screen':
        final orderId=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen(orderId: orderId,));
      case'/profile_screen':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case'/change_phone_number_screen':
        return MaterialPageRoute(builder: (_) => ChangePhoneNumberScreen());
      case'/verfiy_code_update_screen':
        String phone=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerifyCodeUpdateScreen(phone));
      case'/success_update_phone_screen':
        return MaterialPageRoute(builder: (_) => SuccessUpdatePhoneDialog());
      case'/my_orders_screen':
        return MaterialPageRoute(builder: (_) => MyOrdersScreeen());
      case'/my_location_screen':
        return MaterialPageRoute(builder: (_) => MyAddressScreen());
      case'/fags_screen':
        return MaterialPageRoute(builder: (_) => FaqsScreen());
      case'/about_app_screen':
        return MaterialPageRoute(builder: (_) => AboutAppScreen());
      case'/post_details_screen':
        return MaterialPageRoute(builder: (_) => PostDetailsScreen());
      case'/cart_screen':
        String cartId=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CartScreen(cartId: cartId,));

    }
  }
}



