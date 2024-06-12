import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../conustant/di.dart';
import '../../../conustant/my_colors.dart';
import '../../../conustant/shared_preference_serv.dart';
import '../../../data/model/auth/LoginModel/LoginResponse.dart';
import '../../../data/model/auth/UserDataModel/UserDataResponse.dart';
import '../../../data/model/userIdModel/UserIdResponse.dart';
import '../../../data/reposatory/repo.dart';
import '../../../data/web_service/WebService.dart';
import '../../../ui/screens/buttomNavagation/buttom_navagation_page.dart';

class LoginController extends GetxController {
  Repo repo = Repo(WebService());
  var loginResponse = LoginResponse().obs;
  var userDataResponse = UserDataResponse().obs;
  var userIdResponse = UserIdResponse().obs;
  var from="";
  var isLoading = false.obs;
  Rx<bool> isVisable = false.obs;
  Rx<bool> obscureText = true.obs;
  bool isLogin = false;
  var resultCodeLogin = 0;
  var resultCodeUserData=0;
  var token = "";
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() async {
    getToken();
    super.onInit();
  }

  void getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print("tokeen is " + token!);
    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
      print(fcmToken);
    })
        .onError((err) {
      print("Error getting token");
    });
  }

  login(BuildContext context) async {

    loginResponse.value =
    await repo.login(PhoneController.text,passController.text);
    isVisable.value=false;
    if(resultCodeLogin==200){
      if(loginResponse.value.token!=null){
        isLogin = true;
        sharedPreferencesService.setBool("islogin", isLogin);
        sharedPreferencesService.setString('token', loginResponse.value.token!);
        print("tokkk222/"+loginResponse.value.token!);
        await getUserData(context);
      }else{
        Fluttertoast.showToast(
            msg: 'there_is_error_in_the_email_or_pass'.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.STATUSEREDColor
        );
      }

    }
    //await updateToken();
  }

  getUserData(BuildContext context) async {
    userDataResponse.value = await repo.getUserData();
    if(resultCodeUserData==200){
      isVisable.value = false;
      sharedPreferencesService.setInt('id', userDataResponse.value.id!);
      sharedPreferencesService.setString('name', userDataResponse.value.name??"");
      sharedPreferencesService.setString('email', userDataResponse.value.email??"");
      ///profile//////
      sharedPreferencesService.setString('bio', userDataResponse.value.profile?.bio??"");
      sharedPreferencesService.setString('contact', userDataResponse.value.profile?.contact??"");
      sharedPreferencesService.setString('avatarId', userDataResponse.value.profile?.avatar?.id.toString()??"");
      sharedPreferencesService.setString('avatarOriginal', userDataResponse.value.profile?.avatar?.original??"");
      sharedPreferencesService.setString('avatarThumbnail', userDataResponse.value.profile?.avatar?.thumbnail??"");
      if(sharedPreferencesService.getString("cartId")!="null"){
        print("ll "+sharedPreferencesService.getString("cartId"));
        await updateUserId(sharedPreferencesService.getString("cartId"),
            sharedPreferencesService.getInt("id").toString());
      }else{
        sharedPreferencesService.setString('cartId', userDataResponse.value.cartId.toString()??"");
      }
      if(userDataResponse.value.isActive==1){
        if(from=="cart") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
                  ButtomNavagationPage(2)), (Route<dynamic> route) => false);
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              ButtomNavagationPage(0)), (Route<dynamic> route) => false);
        }
      }else{
        Fluttertoast.showToast(
            msg: 'account_not_active_yet'.tr(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.STATUSEREDColor
        );
      }
      PhoneController.clear();
      passController.clear();
    }
    return userDataResponse.value;
  }

  updateUserId(String cartId,String userId)async{
    userIdResponse.value=await repo.updateUserId(cartId, userId);
    // ignore: unrelated_type_equality_checks
    if(userIdResponse.value.success=="true"){

    }
  }
}