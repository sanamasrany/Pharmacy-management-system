import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_managmentsystem/pharmacyQR/state.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';
import 'package:pharmacy_managmentsystem/shared/network/remote/dio_helper.dart';

//Pharmacy

class Pharmacy_QR_Cubit extends Cubit<Pharmacy_QR_CubitStates> {
  Pharmacy_QR_Cubit() : super(Pharmacy_QR_CubitInitialState());

  static Pharmacy_QR_Cubit get(context) => BlocProvider.of(context);



  String Qrcode ="" ;

  Future<void> getQRCode () async {

    emit(generatePharmacy_QR_CubitLoadingState());
    print("UserLoadingLoginWithGoogleState");
    FormData formData = FormData.fromMap({

      'pharmacy_id':CacheHelper.getData(key: 'pharmacy_id'),


    });
    print("respons");

    await DioHelper.postData(

      url:"pharmacy/generateQr",


      data: {
        'pharmacy_id':CacheHelper.getData(key: 'pharmacy_id'),
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");

      Qrcode = value.data.toString() ;
      print( "Super Important ${Qrcode.toString()}");
      emit(generatePharmacy_QR_CubitSuccessState(value.statusCode));

      print(value.statusCode);
      // print(value.data);
      print("generatePharmacy_QR_CubitSuccessState");

    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(generatePharmacy_QR_CubitErrorState(error.toString()));
      print(error);
      print(statusCode);

    });
  }






}
