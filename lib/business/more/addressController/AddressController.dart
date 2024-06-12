
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../conustant/toast_class.dart';
import '../../../data/model/auth/UserDataModel/UserDataResponse.dart';
import '../../../data/model/more/addressModel/AddressResponse.dart';
import '../../../data/reposatory/repo.dart';
import '../../../data/web_service/WebService.dart';
import '../../createOrderController/CreateOrderController.dart';

class AddressController extends GetxController {
  Repo repo = Repo(WebService());
  var addressResponse = UserDataResponse().obs;
  var addAddressResponse = AddressResponse().obs;
  Rx<bool> isVisable = false.obs;
  var isLoading = false.obs;
  var resultCodeListAddress=0;
  var resultCodeAddAddress=0;
  var resultCodeEditeAddress=0;
  var resultCodeDeleteAddress=0;
  bool isActive = false;
  Rx<int> isActive2 = 1.obs;

  ///////////////////////////addSheet//////////////////////////
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  ///////////////////////////editSheet//////////////////////////
  TextEditingController addressEditeCon = TextEditingController();
  TextEditingController countryEditeCon = TextEditingController();
  TextEditingController cityEditeCon = TextEditingController();
  TextEditingController stateEditeCon = TextEditingController();
  TextEditingController zipEditeCon = TextEditingController();
  TextEditingController streetEditeCon = TextEditingController();
  final createOrderController = Get.put(CreateOrderController());

  RxList<dynamic> addressList=[].obs;

  getAddressList() async {
    isLoading.value=true;
    addressResponse.value = await repo.getUserData();
    if(resultCodeListAddress==200){
      isLoading.value = false;
      addressList.value=addressResponse.value.address??[];
      if(addressList.value.isEmpty){
        createOrderController.streetAddress = ''.obs;
        createOrderController.countryAddress = ''.obs;
        createOrderController.stateAddress = ''.obs;
        createOrderController.tittleAddress = ''.obs;
        createOrderController.zipAddress = ''.obs;
        createOrderController.addAddress.value=true;
      }
    }
    return addressResponse.value;
  }

  addAddress(BuildContext context) async {
    isVisable.value=true;
    addAddressResponse.value = await repo.addAddress(
        addressTxtController.text,
        stateController.text,
        zipCodeController.text,
        cityController.text,
        streetController.text,isActive);
    if(resultCodeAddAddress==201){
      isVisable.value=false;
      getAddressList();
      Navigator.pop(context);

    }
    return addAddressResponse.value;
  }

  addAddressForOrder(BuildContext context) async {
    isVisable.value=true;
    addAddressResponse.value = await repo.addAddress(
        addressTxtController.text,
        stateController.text,
        zipCodeController.text,
        cityController.text,
        streetController.text,isActive);
    if(resultCodeAddAddress==201){
      isVisable.value=false;
      createOrderController.getAddressList();
      Navigator.pop(context);

    }
    return addAddressResponse.value;
  }

  editAddress(BuildContext context,int id) async {
    isVisable.value=true;
    var respone;
    respone = await repo.editeAddress(
      id,
        addressEditeCon.text,
        stateEditeCon.text,
        zipEditeCon.text,
        cityEditeCon.text,
        streetEditeCon.text,isActive);
    if(resultCodeEditeAddress==200){
      isVisable.value=false;
      getAddressList();
      Navigator.pop(context);
      addressTxtController.clear();
      cityController.clear();
      stateController.clear();
      zipCodeController.clear();
      streetController.clear();
    }
    return respone;
  }

  deleteAddress(int id,BuildContext context)async{
    var respone=await repo.deleteAddress(id);
    print("nbb"+resultCodeEditeAddress.toString());
    if(resultCodeDeleteAddress==200){
      Navigator.pop(context);
      getAddressList();
    }else {
      Navigator.pop(context);
      ToastClass.showCustomToast(context, "an_error_occurred", 'error');
    }
    return respone;
  }


}