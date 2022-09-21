import 'package:ecommerce_app/repo/yemeklerdao_repository.dart';

class YemekSepetCubit {
  YemekSepetCubit():super();

  var yrepo=YemeklerDaoRepository();

  Future<void> yemekEkle(String yemek_adi,String yemek_resim_adi,String yemek_fiyat, String yemek_siparis_adet,String kullanici_adi) async{
    await yrepo.yemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }

  Future<void> yemekAl(String kullanici_adi) async{
    await yrepo.yemekAl(kullanici_adi);
  }
}