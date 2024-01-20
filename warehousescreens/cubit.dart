import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';
import 'package:pharmacy_managmentsystem/shared/network/remote/dio_helper.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/states.dart';


class WarehouseAddEmpAndDisCubit extends Cubit<WarehouseAddEmpAndDisStates> {
  WarehouseAddEmpAndDisCubit() : super(WarehouseAddEmpAndDisInitialState());

  static WarehouseAddEmpAndDisCubit get(context) => BlocProvider.of(context);




  Future<void> addemployeetowarehouse({

    required String employeeemail,

  }) async {
    emit(WarehouseAddEmpLoadingState());
    print("WarehouseAddEmpLoginWithGoogleState");
    FormData formData = FormData.fromMap({

      'warehouse_id': CacheHelper.getData(key: 'warehouse_id'),
      'employeeEmail':employeeemail

    });
    print("respons");

    await DioHelper.postData(

      url:"warehouse/makeEmployee",


      data: {
        'warehouse_id': CacheHelper.getData(key: 'warehouse_id'),
        'employeeEmail':employeeemail
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      print(value.data.toString());
      emit(WarehouseAddEmpSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("WarehouseAddEmpSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(WarehouseAddEmpErrorState(statusCode));
      print(error);
       print(statusCode);

    });
  }

  Future<void> adddispensertowarehouse({

    required String dispensereemail,

  }) async {
    emit(WarehouseAddDisLoadingState());
    print("WarehouseAddDisLoadingState");
    FormData formData = FormData.fromMap({

      'warehouse_id': CacheHelper.getData(key: 'warehouse_id'),
      'dispenserEmail':dispensereemail

    });
    print("respons");

    await DioHelper.postData(

      url:"warehouse/makeDispenser",


      data: {
        'warehouse_id': CacheHelper.getData(key: 'warehouse_id'),
        'dispenserEmail':dispensereemail
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      print(value.data.toString());
      emit(WarehouseAddDisSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("WarehouseAddDisSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(WarehouseAddDisErrorState(statusCode));
      print(error);
      print(statusCode);

    });
  }

  List<dynamic> SearchWarehouseMedicines =[];


  Future<void> getSearchwarehouses({
    required String value,

  }) async {
    emit(SearchwarehouseLoadingState());
    print("UserLoadingState");
    //print(value);
    print(CacheHelper.getData(key: 'accessToken'));

    print("respons");

    await  DioHelper.getData(

      url:"warehouse/wharehouseWhichHaveMedicine",
      query: {
        'search':'$value',
      },
      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      SearchWarehouseMedicines = value.data['warehouseMedicines'];
      print(SearchWarehouseMedicines);

      emit(SearchwarehouseSuccessState());


    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(SearchwarehouseErrorState(statusCode));
      print("pp ${error.toString()}");
      print(statusCode);

    });
  }






}
