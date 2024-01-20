//pharmacy
abstract class WarehouseAddEmpAndDisStates {}

class WarehouseAddEmpAndDisInitialState extends WarehouseAddEmpAndDisStates {}

class WarehouseAddEmpLoadingState extends WarehouseAddEmpAndDisStates {}
class WarehouseAddEmpSuccessState extends WarehouseAddEmpAndDisStates {
  var value;
  WarehouseAddEmpSuccessState(this.value);
}
class WarehouseAddEmpErrorState extends WarehouseAddEmpAndDisStates {
  var error;

  WarehouseAddEmpErrorState(this.error);
}



class WarehouseAddDisLoadingState extends WarehouseAddEmpAndDisStates {}
class WarehouseAddDisSuccessState extends WarehouseAddEmpAndDisStates {
  var value;
  WarehouseAddDisSuccessState(this.value);
}
class WarehouseAddDisErrorState extends WarehouseAddEmpAndDisStates {
  var error;

  WarehouseAddDisErrorState(this.error);
}


class SearchwarehouseLoadingState extends WarehouseAddEmpAndDisStates {}
class SearchwarehouseSuccessState extends WarehouseAddEmpAndDisStates {

  SearchwarehouseSuccessState();
}
class SearchwarehouseErrorState extends WarehouseAddEmpAndDisStates {
  var error;

  SearchwarehouseErrorState(this.error);
}


