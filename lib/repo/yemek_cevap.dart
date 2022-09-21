import 'package:ecommerce_app/entity/yemek.dart';

class YemeklerCevap {
  List<Yemekler> yemekler;
  int success;

  YemeklerCevap({required this.yemekler, required this.success});

  factory YemeklerCevap.jsonForm(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemekler = jsonArray
        .map((jsonArrayNenesi) => Yemekler.fromJson(jsonArrayNenesi))
        .toList();
        int success= json["success"] as int ;

        return YemeklerCevap(yemekler: yemekler, success: success);
  }
}
