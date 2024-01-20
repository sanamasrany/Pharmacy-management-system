//pharmacy
abstract class Pharmacy_QR_CubitStates {}

class Pharmacy_QR_CubitInitialState extends Pharmacy_QR_CubitStates {}

class generatePharmacy_QR_CubitLoadingState extends Pharmacy_QR_CubitStates {}
class generatePharmacy_QR_CubitSuccessState extends Pharmacy_QR_CubitStates {

  var value;
  generatePharmacy_QR_CubitSuccessState(this.value);
}
class generatePharmacy_QR_CubitErrorState extends Pharmacy_QR_CubitStates {
  var error;

  generatePharmacy_QR_CubitErrorState(this.error);
}


