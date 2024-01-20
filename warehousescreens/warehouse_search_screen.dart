

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
import 'package:pharmacy_managmentsystem/warehousescreens/cubit.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/states.dart';



class SearchWareHouseMedScreen extends StatelessWidget {

  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WarehouseAddEmpAndDisCubit, WarehouseAddEmpAndDisStates>(
      listener:(context,state) {



      },
      builder:(context,state)  {
        var searchwarehouselist = WarehouseAddEmpAndDisCubit.get(context).SearchWarehouseMedicines;



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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [



                  defaultSearch(
                    controller:searchController,label:"Search for Medicine ".tr ,
                    // width:MediaQuery.of(context).size.width,
                    // height:MediaQuery.of(context).size.height*0.06,
                    type:TextInputType.text ,prefix:Icons.search_rounded ,
                    onChange: (value){
                      print(value);
                      WarehouseAddEmpAndDisCubit.get(context).getSearchwarehouses(value: value);
                    },
                    validator:( value)
                    {
                      if(value.isEmpty)
                      {
                        return 'Search for Warehouse';
                      }
                      else{
                        return null;
                      }
                    },
                  )
                  ,
                  //Text
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                      ConditionalBuilder(
                        condition: state is !MapNearbyLoadingState ,
                        builder: (context) =>
                            Container(
                              height: MediaQuery.of(context).size.height*0.7,
                              width: double.infinity,
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:(context, index) {
                                    return
                                      InkWell(

                                        onTap: () async{

                                          // navigateTo(context: context, widget: Maptry(position : position));


                                        },
                                        child: Container(
                                          width: 220,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color:HexColor("E5E4E2"),
                                          ),
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment:  CrossAxisAlignment.center,
                                            children: [

                                              Icon(Icons.warehouse)
                                              ,
                                              SizedBox(width: 5),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:  CrossAxisAlignment.center,
                                                children: [

                                                  Text("${searchwarehouselist[index]['warehouse']['warehouseName']} "
                                                    ,style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  SizedBox(height: 5,),



                                                ],
                                              )
                                            ],
                                          ),

                                        ),
                                      );


                                  },
                                  separatorBuilder: (context, index) => SizedBox(height: 12),
                                  itemCount: searchwarehouselist.length
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      )
                  ),//pharmacy




                ],
              ),


            ),
          ),

        );

      },
    );



  }



}
