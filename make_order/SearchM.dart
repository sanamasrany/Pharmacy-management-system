import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/cubit/cubit.dart';
import 'package:pharmacy_managmentsystem/Home/cubit/status.dart';
import 'package:pharmacy_managmentsystem/make_order/updatePharmacyM.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';

import '../shared/network/local/cache_helper.dart';
import 'button_screen.dart';

class SearchM extends StatelessWidget {
   SearchM({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  var data=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        //var searchlist = PharmacyHomeCubit.get(context).SearchMedicinesPharmacy;

        return Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 80,
          //   titleSpacing: 0.0,
          //   leadingWidth: 46,
          //   elevation: 0.0,
          //   flexibleSpace: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [
          //           HexColor('A8BEE7'),
          //           HexColor('AEC9DE'), //gray light
          //           //gray dark
          //           HexColor('BBC5CE'),
          //         ],
          //         tileMode: TileMode.clamp,
          //       ),
          //     ),
          //   ),
          //   leading:Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: () {
          //       Navigator.pop(context);
          //     }, icon:Icon(Icons.arrow_back,)),
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text("Search " ),
          //   ),
          //
          //
          //
          // ),
          extendBodyBehindAppBar: true,
          appBar:   AppBar(
            toolbarHeight: 160,
            leadingWidth:double.infinity,
            elevation: 0.0,

            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(color: Colors.transparent,),
              ),
            ),

            backgroundColor:Colors.white.withAlpha(100) ,

            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0,left: 8),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        navigateTo(context: context,widget:  Button());
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text("354".tr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.grey.shade800,
                        )),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0,left:15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      defaultSearch(
                        controller: searchController,
                        label: "355".tr,
                        // width:MediaQuery.of(context).size.width,
                        // height:MediaQuery.of(context).size.height*0.06,
                        type: TextInputType.text,
                        prefix: Icons.search_rounded,
                        onChange: (value) {
                          PharmacyHomeCubit.get(context).getSearchPharmacy(value: value,id: CacheHelper.getData(key: "idPharmacy"));
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Search for medicine';
                          }
                          else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),


          ),

          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(

                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'), //gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'), //
                  HexColor('D3C8CC'),
                  HexColor('D3CACF'),
                  HexColor('DBD9DE'),
                  HexColor('D7D2D8'),

                ],
                tileMode: TileMode.clamp,

              ),

            ),

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  //Text
                  //pharmacy
                  Padding(
                      padding: const EdgeInsets.all(32.0),
                      child:
                      ConditionalBuilder(
                        condition: state is !PharmacySearchLoadingState ,
                        builder: (context) =>
                            Container(
                              height:100000,
                              width: double.infinity,
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:(context, index) {
                                    return
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => UpdateMedicinePharmacy(), arguments: [
                                            PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].id,//warehouseMedicine_id

                                          ]);

                                        },
                                        child: Stack(
                                          alignment: AlignmentDirectional.bottomEnd,
                                          children: [

                                            Container(

                                              //height: MediaQuery.of(context).size.height*0.3,
                                              width: double.infinity,
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color:Colors.white.withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(24.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("375".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

                                                        Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.tradeNameEn}"
                                                            " ${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.tradeNameAr}",style: TextStyle(fontSize: 12)),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("376".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

                                                        Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.descriptionEn}"
                                                            ,style: TextStyle(fontSize: 12)),
                                                        SizedBox(width: 8,),
                                                        Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.descriptionAr}"
                                                            ,style: TextStyle(fontSize: 12)),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("345".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 3.0),
                                                          child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.company!.nameEn}"
                                                              ,style: TextStyle(fontSize: 15)),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:2),
                                                          child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.company!.nameAr}"
                                                              ,style: TextStyle(fontSize: 10)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("347".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 3.0),
                                                          child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.commercialPrice}"
                                                              ,style: TextStyle(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("346".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 3.0),
                                                          child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].medicine!.netPrice}"
                                                              ,style: TextStyle(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("348".tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                                        Padding(
                                                          padding: const EdgeInsets.all(3.0),
                                                          child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines![index].quantity}"
                                                              ,style: TextStyle(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:HexColor(green.toString()),

                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(16),
                                                    topLeft: Radius.circular(16)
                                                ),
                                              ),
                                              height: 30,
                                              width: 150,
                                              child: Center(child: Text("356".tr,style: TextStyle(color: Colors.white,fontSize: 12),)),

                                            ),
                                          ],

                                        ),
                                      );


                                  },
                                  separatorBuilder: (context, index) => SizedBox(height: 12),
                                  itemCount: PharmacyHomeCubit.get(context).SearchMedicinesPharmacy.pharmacyMedicines!.length
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      )
                  ),

                ],
              ),


            ),
          ),

        );
      },
    );
  }
}
