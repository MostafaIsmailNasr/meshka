import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mashkah_library/conustant/my_colors.dart';
import 'package:mashkah_library/ui/widget/product/variableItem/variableItemShap/VariableItemShap.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/productDetailsController/ProductDetailsController.dart';
import '../../../../data/model/productDetailsModel/ProductDetailsResponse.dart';

class VariableItem extends StatefulWidget{
  Variations? variations;
  //VariationOptions? variationOptions;
  int indexItem;

  VariableItem({required this.variations,required this.indexItem});

  @override
  State<StatefulWidget> createState() {
    return _VariableItem();
  }
}

class _VariableItem extends State<VariableItem>{
  final productDetailsController = Get.put(ProductDetailsController());
  int? selectedFlage=0;
  int? attributeId=0;
  var tittle="";
  Map<int,String>t={};
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.variations?.attribute?.name??"", style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'bold',
              fontWeight: FontWeight.w700,
              color:MyColors.Dark2)),
          SizedBox(
            height: 7.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: widget.variations?.attribute?.values?.length,
                itemBuilder: (context, int index) {
                  return VariableItemShape(
                      values: widget.variations?.attribute?.values?[index],
                    selected: selectedFlage==widget.variations?.attribute?.values?[index].id,
                    onTap: (){
                      setState(() {
                        selectedFlage=widget.variations!.attribute!.values![index].id;
                        print("nh"+widget.indexItem.toString());

                          productDetailsController.addedVariableList[widget.indexItem] =widget.variations?.attribute?.values?[index].value;
                          productDetailsController.tittleSearch =
                              productDetailsController.addedVariableList.join("/").replaceAll("/null", "");
                          print("llln"+productDetailsController.tittleSearch);
                          print("llln2"+productDetailsController.addedVariableList.toString());


                        for(int i=0;i<productDetailsController.variationOptionsList.length;i++){
                          if(productDetailsController.tittleSearch.contains("/")){
                            if(productDetailsController.tittleSearch.toLowerCase()
                                ==productDetailsController.variationOptionsList[i].title.toLowerCase()){
                              productDetailsController.maxPrice.value=productDetailsController.variationOptionsList[i]!.price.toString()??"";
                              productDetailsController.minPrice.value=productDetailsController.variationOptionsList[i]!.salePrice.toString()??"";
                              productDetailsController.variationId.value=productDetailsController.variationOptionsList[i]!.id.toString()??"";
                              productDetailsController.skuProduct.value=productDetailsController.variationOptionsList[i]!.sku.toString()??"";

                              productDetailsController.isExiste.value=false;
                              print("kkkkk2 "+productDetailsController.isExiste.value.toString());
                              return;
                            }else{
                              productDetailsController.isExiste.value=true;
                              productDetailsController.maxPrice.value=productDetailsController.productDetailsResponse.value.maxPrice.toString()??"";
                              productDetailsController.minPrice.value=productDetailsController.productDetailsResponse.value.minPrice.toString()??"";
                              productDetailsController.variationId.value="";
                              productDetailsController.skuProduct.value="";

                              print("mjjj");
                            }
                          }
                        }
                        print("kkkkk "+productDetailsController.isExiste.value.toString());

                          // if(productDetailsController.tittleSearch.contains("/")){
                          //   if(productDetailsController.tittleSearch.toLowerCase()==productDetailsController.variationOptionsList[widget.indexItem].title.toLowerCase()){
                          //     productDetailsController.maxPrice.value=widget.variationOptions!.price.toString()??"";
                          //     productDetailsController.minPrice.value=widget.variationOptions!.salePrice.toString()??"";
                          //     productDetailsController.isExiste.value=false;
                          //   }else{
                          //     productDetailsController.isExiste.value=true;
                          //     print("mjjj");
                          //   }
                          // }


                      });
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

}