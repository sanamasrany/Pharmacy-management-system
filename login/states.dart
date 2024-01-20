import 'package:pharmacy_managmentsystem/AreasModel/areas_model.dart';
import 'package:pharmacy_managmentsystem/Model/Login_Model.dart';
import 'package:pharmacy_managmentsystem/Model/Login_With_Google_Model.dart';
import 'package:pharmacy_managmentsystem/Model/Register_pharmacy.dart';
import 'package:pharmacy_managmentsystem/Model/UserModel.dart';

abstract class PharmacyLoginStates {}

class PharmacyInitialState extends PharmacyLoginStates {}

class PharmacyLoadingState extends PharmacyLoginStates {}
class PharmacySuccessState extends PharmacyLoginStates {
  final LoginModel loginModel;
  var value;
  PharmacySuccessState(this.loginModel,this.value);

}
class PharmacyErrorState extends PharmacyLoginStates {
  var error;

  PharmacyErrorState(this.error);
}

class ChangePassWordVisibilityState extends PharmacyLoginStates{}


class UserLoadingLoginWithGoogleState extends PharmacyLoginStates {}
class UserSuccessLoginWithGoogleState extends PharmacyLoginStates {
  final LoginModel loginModel;
  var value;
  UserSuccessLoginWithGoogleState(this.loginModel,this.value);
}
class UserErrorLoginWithGoogleState extends PharmacyLoginStates {
  var error;

  UserErrorLoginWithGoogleState(this.error);
}


//class ChangePassWordVisibilityState extends PharmacyLoginStates{}
///////////////////////////////////////////////
class AreasLoadingState extends PharmacyLoginStates {}
class AreasSuccessState extends PharmacyLoginStates {
  final AreasModel areasModel;
  var value;
  AreasSuccessState(this.areasModel,this.value);

}
class AreasErrorState extends PharmacyLoginStates {
  var error;

  AreasErrorState(this.error);
}
class UserLoadingDataState extends PharmacyLoginStates {}
class UserSuccessDataState extends PharmacyLoginStates {
  final UserModel userModel;
  var value;
  UserSuccessDataState(this.value, this.userModel);
}
class UserErrorDataState extends PharmacyLoginStates {
  var error;

  UserErrorDataState(this.error);
}
///////////////////////////////////////////
class PharmacyWInitialState extends PharmacyLoginStates {}

class PharmacyWLoadingState extends PharmacyLoginStates {

}
class PharmacyWSuccessState extends PharmacyLoginStates {
  final ModelPharmacy modelPharmacy;
  var value;
  PharmacyWSuccessState(this.value, this.modelPharmacy);

}
class PharmacyWErrorState extends PharmacyLoginStates {
  var error;

  PharmacyWErrorState(this.error);
}