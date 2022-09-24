import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/repo/yemeklerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/yemek.dart';
import '../repo/yemeklerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit():super(<Yemekler>[]);

  var yrepo= YemeklerDaoRepository();

  Future<void> yemekYukle() async{
    var liste =await yrepo.tumYemek();
    emit(liste);
  }
  
}