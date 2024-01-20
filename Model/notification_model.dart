import 'dart:convert';

Notification1 notificationFromJson(String str) => Notification1.fromJson(json.decode(str));

String notificationToJson(Notification1 data) => json.encode(data.toJson());

class Notification1 {
  WarehouseMedicine warehouseMedicine;

  Notification1({
    required this.warehouseMedicine,
  });

  factory Notification1.fromJson(Map<String, dynamic> json) => Notification1(
    warehouseMedicine: WarehouseMedicine.fromJson(json["warehouseMedicine"]),
  );

  Map<String, dynamic> toJson() => {
    "warehouseMedicine": warehouseMedicine.toJson(),
  };
}

class WarehouseMedicine {
  int id;
  int maxQuantity;
  int warehouseId;
  int medicineId;
  DateTime createdAt;
  DateTime updatedAt;
  Warehouse warehouse;
  Medicine medicine;

  WarehouseMedicine({
    required this.id,
    required this.maxQuantity,
    required this.warehouseId,
    required this.medicineId,
    required this.createdAt,
    required this.updatedAt,
    required this.warehouse,
    required this.medicine,
  });

  factory WarehouseMedicine.fromJson(Map<String, dynamic> json) => WarehouseMedicine(
    id: json["id"],
    maxQuantity: json["max_quantity"],
    warehouseId: json["warehouse_id"],
    medicineId: json["medicine_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    warehouse: Warehouse.fromJson(json["warehouse"]),
    medicine: Medicine.fromJson(json["medicine"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "max_quantity": maxQuantity,
    "warehouse_id": warehouseId,
    "medicine_id": medicineId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "warehouse": warehouse.toJson(),
    "medicine": medicine.toJson(),
  };
}

class Medicine {
  int id;
  dynamic barcode;
  String tradeNameAr;
  String tradeNameEn;
  String descriptionEn;
  String descriptionAr;
  String medicineFormAr;
  String medicineFormEn;
  int commercialPrice;
  int netPrice;
  String size;
  int parts;
  int companyId;
  dynamic medicinePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;

  Medicine({
    required this.id,
    required this.barcode,
    required this.tradeNameAr,
    required this.tradeNameEn,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.medicineFormAr,
    required this.medicineFormEn,
    required this.commercialPrice,
    required this.netPrice,
    required this.size,
    required this.parts,
    required this.companyId,
    required this.medicinePhotoPath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["id"],
    barcode: json["barcode"],
    tradeNameAr: json["trade_name_ar"],
    tradeNameEn: json["trade_name_en"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    medicineFormAr: json["medicine_form_ar"],
    medicineFormEn: json["medicine_form_en"],
    commercialPrice: json["commercial_price"],
    netPrice: json["net_price"],
    size: json["size"],
    parts: json["parts"],
    companyId: json["company_id"],
    medicinePhotoPath: json["medicine_photo_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "barcode": barcode,
    "trade_name_ar": tradeNameAr,
    "trade_name_en": tradeNameEn,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "medicine_form_ar": medicineFormAr,
    "medicine_form_en": medicineFormEn,
    "commercial_price": commercialPrice,
    "net_price": netPrice,
    "size": size,
    "parts": parts,
    "company_id": companyId,
    "medicine_photo_path": medicinePhotoPath,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Warehouse {
  int id;
  int userId;
  String warehouseName;
  String number;
  String pathOfPhoto;
  dynamic ownerOfPermissionName;
  int validated;
  int locationId;
  DateTime createdAt;
  DateTime updatedAt;

  Warehouse({
    required this.id,
    required this.userId,
    required this.warehouseName,
    required this.number,
    required this.pathOfPhoto,
    required this.ownerOfPermissionName,
    required this.validated,
    required this.locationId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"],
    userId: json["user_id"],
    warehouseName: json["warehouseName"],
    number: json["number"],
    pathOfPhoto: json["path_of_photo"],
    ownerOfPermissionName: json["owner_of_permission_name"],
    validated: json["validated"],
    locationId: json["location_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "warehouseName": warehouseName,
    "number": number,
    "path_of_photo": pathOfPhoto,
    "owner_of_permission_name": ownerOfPermissionName,
    "validated": validated,
    "location_id": locationId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}