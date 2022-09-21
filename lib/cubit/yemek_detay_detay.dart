import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<List<Yemekler>> {
  
  YemekDetayCubit():super(<Yemekler>[]);

  var yrepo= YemeklerDaoRepository();
Future<void> yemekEkle(String yemek_adi,String yemek_resim_adi,String yemek_fiyat, String yemek_siparis_adet,String kullanici_adi) async{
    await yrepo.yemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }
  Future<void> yemekYukle() async{
    var liste =await yrepo.tumYemek();
    emit(liste);
  }
  
}
