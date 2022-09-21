
import 'package:ecommerce_app/cubit/yemek_detay_detay.dart';
import 'package:ecommerce_app/cubit/yemek_sepet_cubit.dart';
import 'package:ecommerce_app/entity/sepet_yemekler.dart';

import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/views/yemek_sepet.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class YemekDetaySayfa extends StatefulWidget {
  SepetYemekler sepetYemekler;
  Yemekler yemek;
  final resim;
  final fiyat;
  final isim;
  final resim_adi;

  YemekDetaySayfa(
      {Key? key,
      required this.yemek,
      required this.sepetYemekler,
      this.resim,
      this.fiyat,
      this.isim,
      this.resim_adi})
      : super(key: key);

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
   late SepetYemekler sepetYemekler;
   @override
  void initState() {
    var yemek = widget.yemek;
    var yemek_adi = yemek.yemek_adi;
    var yemek_resim_adi=yemek.yemek_resim_adi;
    var yemek_fiyat=yemek.yemek_fiyat;
    var yemek_siparis_adet =sepetYemekler.yemek_siparis_adet;
    var kullanici_adi=sepetYemekler.kullanici_adi;
    

    super.initState();
    context.read<YemekDetayCubit>().yemekYukle();
    context.read<YemekSepetCubit>().yemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  } 

  int count = 0;

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context);
    final double screenH = s.size.height;
    final double screenW = s.size.width;
    Yemekler yemek;
    SepetYemekler sepetYemekler;
    //final yemek_siparis_adeti;

   /*  void incProductCount() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => YemekSepet(yemek: yemek, sepetYemekler: sepetYemekler,yemek_adi: yemek.yemek_adi,yemek_kullanici_adi: sepetYemekler.kullanici_adi,yemek_resim_adi: yemek.yemek_resim_adi,yemek_siparis_adet: sepetYemekler.yemek_siparis_adet,
      
      ))).then((value) {
        context.read<YemekDetayCubit>().yemekEkle();
      });
    } */

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => YemekSepet()
      )).then((value) {
        context.read<YemekDetayCubit>();
      });

        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      appBar: CustomAppBar(
        title: "Detay",
      ),
      body: Column(
        children: [
          Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(widget.resim_adi)))),
          Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize:MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (count <= 0) {
                        setState(() {
                          count = 0;
                        });
                      } else {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                    child: Icon(Icons.remove)),
                Text(
                  "$count",
                  style: TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                    child: Icon(Icons.add))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Container(
            padding: const EdgeInsets.only(top: 14),
            height: 50,
            width: 100,
            child: Text(
              widget.isim,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(color: Colors.black),
          )),
          Align(
            alignment: Alignment.bottomLeft,
            
            
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 14),
                  height: 50,
                  width: 100,
                  child: Text(
                    widget.fiyat.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
