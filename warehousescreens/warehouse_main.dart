

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/map/cubit.dart';
import 'package:pharmacy_managmentsystem/map/google_map_try.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/warehouse_add_dispenser.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/warehouse_add_employee.dart';



class Warehouse_buttoms extends StatelessWidget {




  @override
  Widget build(BuildContext context) {




        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 46,
            elevation: 0.0,
            flexibleSpace: Container(
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
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),

          ),

          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:LinearGradient(

                begin:  Alignment.topRight,
                end:Alignment.bottomLeft ,

                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'),//gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'),//
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 100,),

                  newDefaultButton(

                      background: Colors.white,
                      text: "200".tr,
                      //  background: HexColor(green.toString()),
                      function: (){

                        navigateAndFinish(context: context, widget: Add_employee_warehouse());
                        // navigateTo(widget: HomeScreen(),context: context);
                      },

                      width : MediaQuery.of(context).size.width *0.6,
                      isAppbar: false
                  ),
                  SizedBox(height: 50,),

                  newDefaultButton(

                      background: Colors.white,
                      text: "201".tr,

                      //  background: HexColor(green.toString()),
                      function: (){

                        navigateAndFinish(context: context, widget: Add_dispenser_warehouse());
                        // navigateTo(widget: HomeScreen(),context: context);
                      },

                      width : MediaQuery.of(context).size.width *0.6,
                      isAppbar: false
                  ),







                ],
              ),


            ),
          ),

        );






  }



}
