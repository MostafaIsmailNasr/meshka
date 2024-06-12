import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../conustant/di.dart';
import '../../../conustant/my_colors.dart';
import '../../../conustant/shared_preference_serv.dart';
import '../../../data/model/auth/RegisterModel/RegisterResponse.dart';
import '../../../data/model/auth/UserDataModel/UserDataResponse.dart';
import '../../../data/model/userIdModel/UserIdResponse.dart';
import '../../../data/reposatory/repo.dart';
import '../../../data/web_service/WebService.dart';
import '../../../ui/screens/buttomNavagation/buttom_navagation_page.dart';

class RegisterController extends GetxController {
  Repo repo = Repo(WebService());
  var registerResponse = RegisterResponse().obs;
  var userDataResponse = UserDataResponse().obs;
  var isLoading = false.obs;
  Rx<bool> isVisable = false.obs;
  bool isLogin = false;
  var resultCodeRegister=0;
  var resultCodeUserData=0;
  Rx<bool> obscureText = true.obs;
  var userIdResponse = UserIdResponse().obs;
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  register(BuildContext context) async {
    registerResponse.value =
    await repo.Register(nameController.text,PhoneController.text, passController.text);
    if(resultCodeRegister==200){
      isLogin = true;
      sharedPreferencesService.setBool("islogin", isLogin);
      sharedPreferencesService.setString('token', registerResponse.value.token!);
      print("tokkk222/"+registerResponse.value.token!);
      getUserData(context);
    }
    //await updateToken();
  }

  getUserData(BuildContext context) async {
    userDataResponse.value = await repo.getUserData();
    if(resultCodeUserData==200){
      isVisable.value = false;

      sharedPreferencesService.setString('name', userDataResponse.value.name??"");
      sharedPreferencesService.setString('email', userDataResponse.value.email??"");
      ///profile//////
      sharedPreferencesService.setInt('id', userDataResponse.value.id!);
      sharedPreferencesService.setString('bio', userDataResponse.value.profile?.bio??"");
      sharedPreferencesService.setString('contact', userDataResponse.value.profile?.contact??"");
      sharedPreferencesService.setString('avatarId', userDataResponse.value.profile?.avatar?.id??"");
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
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            ButtomNavagationPage(0)), (Route<dynamic> route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context,'/Login_screen', ModalRoute.withName('/Login_screen'));
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
      nameController.clear();
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