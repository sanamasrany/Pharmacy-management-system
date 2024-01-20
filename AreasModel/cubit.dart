
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_managmentsystem/AreasModel/areas_model.dart';
import 'package:pharmacy_managmentsystem/AreasModel/state.dart';
import 'package:pharmacy_managmentsystem/shared/network/remote/dio_helper.dart';

class PharmacyAreasCubit extends Cubit<PharmacyAreas>{
  PharmacyAreasCubit():super(PharmacyInitialState());
  static PharmacyAreasCubit get(context) => BlocProvider.of(context);
 late AreasModel areasModel;
  Future<void>areas()async{
    print("lood");
    DioHelper.getData2(url:"places" ).then((value){

      areasModel=AreasModel.fromJson(value.data);
      print(value.data);
      emit(PharmacySuccessState(areasModel, value.statusCode));
    }).catchError((error){
      int statusCode = error.response?.statusCode ?? -1;

      emit(PharmacyErrorState(statusCode));
    });
  }

}