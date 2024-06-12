import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../conustant/my_colors.dart';
import '../../../widget/PostsTweetItem.dart';
import 'buttomSheets/addPostSheet/add_post_sheet.dart';

class PostsTweetScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PostsTweetScreen();
  }
}

class _PostsTweetScreen extends State<PostsTweetScreen>with TickerProviderStateMixin{
  var selectedFlage=false;
  List<bool> isFavoriteList = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
      ),
      body: Container(
        margin:  EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 2.h),
        child: postsTweetList()
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              //backgroundColor:MyColors.Dark5,
              builder: (BuildContext context)=>DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.8,
                  minChildSize: 0.32,
                  maxChildSize: 0.8,
                  builder: (BuildContext context, ScrollController scrollController)=> SingleChildScrollView(
                    controller:scrollController,
                    child: AddPostSheet(),
                  )
                //return FilterOrdersScreen();
              )
          );
        },
        backgroundColor: MyColors.MainColor,
        clipBehavior: Clip.antiAlias,
        child:  const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget postsTweetList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount:5,
        itemBuilder: (context,int index){
          return PostsTweetItem(isFavorate: isFavoriteList[index],
            onTap: () {
              setState(() {
                isFavoriteList[index] = !isFavoriteList[index];
              });
            },
          );
        }
    );
  }

}