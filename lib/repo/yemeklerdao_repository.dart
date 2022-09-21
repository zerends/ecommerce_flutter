import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/repo/yemek_cevap.dart';

class YemeklerDaoRepository {
  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.jsonForm(json.decode(cevap)).yemekler;
  }

  Future<List<Yemekler>> tumYemek() async{

    var url ="http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap= await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }

  Future<void> yemekEkle(String yemek_adi,String yemek_resim_adi,String yemek_fiyat, String yemek_siparis_adet,String kullanici_adi)async{
    var url="http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri= {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat" :yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi" :kullanici_adi,

    };
    var cevap=await Dio().post(url,data:FormData.fromMap(veri));
  }

  Future<void> yemekSil(int sepet_yemek_id)async{
    var url="http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri={"sepet_yemek_id":sepet_yemek_id};
    var cevap= await Dio().post(url,data:FormData.fromMap(veri));
  }
  Future<void> yemekAl(String kullanici_adi)async{
    var url="http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri={"kullanici_adi":kullanici_adi};
    var cevap= await Dio().post(url,data:FormData.fromMap(veri));

  }
  
}