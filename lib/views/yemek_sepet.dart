import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/entity/sepet_yemekler.dart';
import 'package:ecommerce_app/entity/yemek.dart';

class YemekSepet extends StatefulWidget {
  
 /* SepetYemekler sepetYemekler;
 final yemek;
 final yemek_adi;
 final yemek_resim_adi;
 final yemek_siparis_adet;
final yemek_kullanici_adi;

  YemekSepet({
    Key? key,
    required this.sepetYemekler, required this.yemek, this.yemek_adi, this.yemek_resim_adi, this.yemek_siparis_adet, this.yemek_kullanici_adi,
  }) : super(key: key);
 */

  @override
  State<YemekSepet> createState() => _YemekSepetState();
}

class _YemekSepetState extends State<YemekSepet> {
  late Yemekler yemek;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Food"),
      body: Center(
        child:Column(children: [
          Container(alignment: Alignment.bottomCenter,height: 100, width: 100,color: Colors.amber, child: Text(yemek.yemek_adi),),
          Container(color: Colors.amber, child: Text("12312"),)
        ],)
      ),
      bottomNavigationBar: NavBar(),
      
    );
  }
}