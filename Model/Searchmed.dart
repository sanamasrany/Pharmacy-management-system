
import 'dart:convert';

List<Searchmed> searchmedFromJson(String str) => List<Searchmed>.from(json.decode(str).map((x) => Searchmed.fromJson(x)));

class Searchmed {
  late  int id;
  late  String tradeNameAr;
  late String tradeNameEn;
  late String description;
  late int companyId;
  late DateTime createdAt;
  late DateTime updatedAt;




   Searchmed.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tradeNameAr= json["trade_name_ar"];
    tradeNameEn= json["trade_name_en"];
    description= json["description"];
    companyId= json["company_id"];
    createdAt= DateTime.parse(json["created_at"]);
    updatedAt= DateTime.parse(json["updated_at"]);
  }

   }
