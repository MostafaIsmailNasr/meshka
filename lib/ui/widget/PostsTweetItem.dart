import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../business/postestTweetController/PostesTweetController.dart';
import '../../conustant/my_colors.dart';
import '../screens/buttomNavagation/postsTweet/buttomSheets/addComment/add_comment_sheet.dart';

class PostsTweetItem extends StatelessWidget{
  var isFavorate;
  GestureTapCallback? onTap;

  PostsTweetItem({required this.isFavorate,required this.onTap});
  final postsTweetController = Get.put(PostesTweetController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/post_details_screen');
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 1.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15.w,
                  height: 8.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        'assets/proff.png',
                        //   loadingBuilder: (context, child,
                        //       loadingProgress) =>
                        //   (loadingProgress == null)
                        //       ? child
                        //       : Center(
                        //       child: CircularProgressIndicator()),
                        // ),
                      )
                  ),
                ),
                SizedBox(width: 1.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("mahmoud", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.Dark1)),
                        SizedBox(width: 1.h,),
                        Text("@mahmoudadel12", style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.Dark3)),
                        SizedBox(width: 1.h,),
                        Text(".16س", style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.Dark3)),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    SizedBox(
                      width: 35.h,
                      child: Text("7 Books To Beat Laziness In 2023 (1)", style:  TextStyle(fontSize: 11.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark2)),
                    ),
                    SizedBox(height: 1.h,),
                    Image.asset('assets/post.png',width: 30.h,height: 29.h,fit: BoxFit.fill,),
                    SizedBox(height: 1.h,),
                    SizedBox(
                      width: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           GestureDetector(
                            onTap: onTap,
                            //     (){
                            //   postsTweetController.isFavorate.value = !postsTweetController.isFavorate.value;
                            // },
                            child:  Row(
                              children: [
                                isFavorate?SvgPicture.asset('assets/heart_fill.svg')
                                    :SvgPicture.asset('assets/heart2.svg'),
                                Text("178", style:  TextStyle(fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400,
                                    color:MyColors.Dark3))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              showModalBottomSheet<void>(
                                  isScrollControlled: true,
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
                                        child: AddCommentSheet(),
                                      )
                                  )
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/comment.svg'),
                                Text("54", style:  TextStyle(fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400,
                                    color:MyColors.Dark3))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/repeat.svg'),
                                Text("22", style:  TextStyle(fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400,
                                    color:MyColors.Dark3))
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: (){

                              },
                              child: SvgPicture.asset('assets/share.svg')),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h,),
                  ],
                ),
              ],
            ),
            SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
    );
  }

}