
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../conustant/di.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/searchModel/SearchResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';

class SearchProductController extends GetxController {
  Repo repo = Repo(WebService());
  var searchResponse = SearchResponse().obs;
  var isLoading = false.obs;
  var isLoadingMore=false;
  var isLoading2=false.obs;
  var resultCodeSearch = 0;
  RxList<dynamic> searchList=[].obs;
  TextEditingController searchTxtController = TextEditingController();
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  int page=1;
  final scroll=ScrollController();

  Future<void> scrollListener()async{
    if(isLoadingMore)return;
    if(scroll.position.pixels == scroll.position.maxScrollExtent){
      isLoadingMore=true;
      page=page+1;
      await search(page,searchTxtController.text);
      isLoadingMore=false;
    }
  }

  search(int page,String word) async {

    if(page==1){
      isLoading.value = true;
    }else{
      isLoading2.value = true;
    }

    Search? loadingItem;

    if (searchResponse.value.currentPage != searchResponse.value.lastPage) {
      loadingItem = Search(name: "loading");
      //isVisable.value=true;
      searchList.add(loadingItem!);
    }

    var response = await repo.search(word,page);

    if (response != null) {
      //isVisable.value=false;
      searchResponse.value = response;
      List<Search> newData = response.data ?? [];

      if (loadingItem != null) {
        searchList.remove(loadingItem);
      }

      if (page == 1) {
        searchList.assignAll(newData);
      } else {
        searchList.addAll(newData);
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


}