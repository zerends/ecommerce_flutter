

import 'package:ecommerce_app/entity/yemek.dart';

class SepetYemekler {
  String sepet_yemek_id;
  String yemek_siparis_adet;
  String kullanici_adi;
  Yemekler yemekler;

  SepetYemekler(
      {required this.kullanici_adi,
      required this.sepet_yemek_id,
      required this.yemek_siparis_adet,
      required this.yemekler});

  factory SepetYemekler.fromJson(Map<String, dynamic> json) {
    return SepetYemekler(
      sepet_yemek_id:json["sepet_yemek_id"] as String,
        kullanici_adi: json["kullanici_adi"] as String,
        
        yemek_siparis_adet: json["yemek_siparis_adet"] as String,
        yemekler: Yemekler.fromJson(json["yemekler"]),
        );
  }
}
