

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/drawer.dart';
import 'package:pharmacy_managmentsystem/map/cubit.dart';
import 'package:pharmacy_managmentsystem/map/google_map_try.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/cubit.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/states.dart';



class Add_employee_warehouse extends StatelessWidget {




  var employeeEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<WarehouseAddEmpAndDisCubit,WarehouseAddEmpAndDisStates>(

        listener: (context, state) {
      if(state is WarehouseAddEmpSuccessState)//نجاح او فشل التسجيل
          {

        if(state.value==200) {

          showToast(text:"Employee has been created." ,state: ToastStates.SUCCESS);

          navigateAndFinish(context: context, widget: drawerScreen());
        }


      }
      if(state is WarehouseAddEmpErrorState){

        if(state.error==422){
          showToast(text:"The selected employee email is invalid." ,state: ToastStates.EROOR);

        }

      }




    },

    builder: (context, state) {
    return
    Scaffold(
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

    begin: Alignment.topRight,
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


    defaultTextFieldPharmacy(
    controller: employeeEmailController,
    type: TextInputType.emailAddress,
    validate: (String? value) {
    if (value!.isEmpty) {
    return "employee email must not be empty";
    }
    return null;
    },
    onSubmit: (value) {},
    hint: "202".tr,
    prefix: Icons.email_outlined),
    SizedBox(height: 50,),

      ConditionalBuilder(
        condition: state is !WarehouseAddEmpLoadingState ,
        builder: (context) =>    newDefaultButton(

            background: Colors.white,
            text: "200".tr,
            //  background: HexColor(green.toString()),
            function: (){
              WarehouseAddEmpAndDisCubit.get(context).addemployeetowarehouse( employeeemail: employeeEmailController.text);

            },

            width : MediaQuery.of(context).size.width *0.6,
            isAppbar: false
        ),
        fallback: (context) =>
        const Center(child: CircularProgressIndicator()),
      ),




    ],
    ),


    ),
    ),

    );
    }
    );






  }



}
