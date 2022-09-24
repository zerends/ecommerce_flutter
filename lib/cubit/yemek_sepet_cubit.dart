import 'package:ecommerce_app/entity/sepet_yemekler.dart';
import 'package:ecommerce_app/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekSepetCubit extends Cubit<void>{
  YemekSepetCubit():super(<SepetYemekler>[]);

  var yrepo=YemeklerDaoRepository();

  /* Future<void> yemekEkle(String yemek_adi,String yemek_resim_adi,String yemek_fiyat, String yemek_siparis_adet,String kullanici_adi) async{
    await yrepo.yemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  } */
 Future<void> yemekSil(int sepet_yemek_id) async{
    await yrepo.yemekSil(sepet_yemek_id);
  }
  Future<void> yemekAl(String kullanici_adi) async{
    await yrepo.yemekAl(kullanici_adi);
  }
}