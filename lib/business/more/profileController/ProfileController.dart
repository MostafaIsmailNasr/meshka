import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


import '../../../conustant/di.dart';
import '../../../conustant/my_colors.dart';
import '../../../conustant/shared_preference_serv.dart';
import '../../../conustant/toast_class.dart';
import '../../../data/model/more/profileModel/UpdateProfileResponse.dart';
import '../../../data/model/more/profileModel/imageModel/ImageResponse.dart';
import '../../../data/reposatory/repo.dart';
import '../../../data/web_service/WebService.dart';
import '../../../ui/screens/buttomNavagation/buttom_navagation_page.dart';

class ProfileController extends GetxController {
  Repo repo = Repo(WebService());
  Rx<bool> isVisable = false.obs;
  Rx<bool> isVisable2 = false.obs;
  var resultCodeUploadImg=0;
  var resultCodeUpdateProfile=0;
  var imageResponse = ImageResponse().obs;
  var updateProfileResponse = UpdateProfileResponse().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  File? image;
  var pic="",name="",email="";
  var installedVersion = "".obs;

  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  getData()async{
    name=sharedPreferencesService.getString("name")??"";
    pic=sharedPreferencesService.getString("avatarOriginal")??"";
    email=sharedPreferencesService.getString("email")??"";
  }

  uploadImage(BuildContext context)async{
    List<dynamic> imgResp = await repo.uploadImg(image);
    isVisable.value=false;
    if(resultCodeUploadImg==200){
      Fluttertoast.showToast(
          msg: "upload image successfully".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.MainColor
      );
      sharedPreferencesService.setString('avatarId',imgResp[0].id.toString()??"");
      sharedPreferencesService.setString('avatarOriginal', imgResp[0].original??"");
      sharedPreferencesService.setString('avatarThumbnail', imgResp[0].thumbnail??"");
    }else {
      Fluttertoast.showToast(
          msg: "error_in_uploading_image".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.STATUSEREDColor
      );
    }
    return imgResp;
  }

  updateProfile(BuildContext context)async{
    updateProfileResponse.value = await repo.updateProfile(
        nameController.text,
        bioController.text,
        PhoneController.text,
        emailController.text);

    isVisable2.value=false;
    if(resultCodeUpdateProfile==200){
      sharedPreferencesService.setInt('id', updateProfileResponse.value.id!);
      sharedPreferencesService.setString('name', updateProfileResponse.value.name??"");
      sharedPreferencesService.setString('email', updateProfileResponse.value.email??"");
      ///profile//////
      sharedPreferencesService.setString('bio', updateProfileResponse.value.profile?.bio??"");
      sharedPreferencesService.setString('contact', updateProfileResponse.value.profile?.contact??"");
      sharedPreferencesService.setString('avatarId', updateProfileResponse.value.profile?.avatar?.id.toString()??"");
      sharedPreferencesService.setString('avatarOriginal', updateProfileResponse.value.profile?.avatar?.original??"");
      sharedPreferencesService.setString('avatarThumbnail', updateProfileResponse.value.profile?.avatar?.thumbnail??"");

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return ButtomNavagationPage( 0);
          }));
      image=null;

    }else {
      // Fluttertoast.showToast(
      //     msg: 'error_in_update_profile'.tr(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: MyColors.STATUSEREDColor
      // );
    }
    return updateProfileResponse.value;
  }

}