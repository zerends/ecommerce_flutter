

import 'package:ecommerce_app/cubit/yemek_detay_detay.dart';
import 'package:ecommerce_app/cubit/yemek_sepet_cubit.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/entity/sepet_yemekler.dart';
import 'package:ecommerce_app/entity/yemek.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YemekSepet extends StatefulWidget {
  //SepetYemekler sepetYemekler;
  //final yemek;
  var sepet_yemek_id;
  var sepet_yemek_adi;
  var yemek_adi;
  var yemek_resim_adi;
  var yemek_siparis_adet;
  var yemek_kullanici_adi;
  var yemek_fiyat;

  YemekSepet({
    Key? key,
    this.sepet_yemek_id,
    this.yemek_adi,
    this.yemek_resim_adi,
    this.yemek_siparis_adet,
    this.yemek_kullanici_adi,
    this.yemek_fiyat,
  }) : super(key: key);

  @override
  State<YemekSepet> createState() => _YemekSepetState();
}

class _YemekSepetState extends State<YemekSepet> {
  //SepetYemekler _sepetYemekler;
  List sepetList = [];
  Future<void> readySharedPreferences() async{


    
    var sharedPreferences = await SharedPreferences.getInstance();
    
    //List<String> sepetList=[widget.yemek_adi,widget.yemek_fiyat,widget.yemek_resim_adi,widget.yemek_siparis_adet,widget.yemek_kullanici_adi];
    var basket = await sharedPreferences.getStringList("sepetList1");
    sepetList.add(basket);
    print(basket);
    print(sepetList);
    setState(() {
      
    });
  }
  /* Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    List<String> sepetList=[widget.yemek_adi,widget.yemek_fiyat,widget.yemek_resim_adi,widget.yemek_siparis_adet.toString(),widget.yemek_kullanici_adi];
    sharedPreferences.setStringList("sepetList1", sepetList);
    print("yemekList");
    print(sepetList);
  } */
  
  @override
  void initState() {
    super.initState();
    print(widget.yemek_adi);
    
    //saveData();
    // yemek=widget.yemek;
    //sepetYemek=widget.sepetYemekler;
    //context.read<YemekSepetCubit>().yemekSil(widget.sepet_yemek_id);
    
  }
  
  @override  
  Widget build(BuildContext context) {
 
    SepetYemekler sepetYemekler;
    var s = MediaQuery.of(context);
    final double screenH = s.size.height;
    final double screenW = s.size.width;
   // print(sepetList(0));
    //Yemekler yemek;
    // widget.yemek_siparis_adet.toInt();
    return Scaffold(
      appBar: CustomAppBar(title: "Sepet"),
      body: ListView(
        children: [
          Container(
            height: screenH,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              
              children: [
                Container(
                  height: 130,
                  //width:s ,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => YemekSepet()).
                                },
                                child: Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              widget.yemek_resim_adi))),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                   widget.yemek_adi,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    widget.yemek_fiyat,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Container(
                                    height: 20,
                                    width: 25,
                                    decoration:
                                        BoxDecoration(color: Colors.black12),
                                    child: Text(
                                      widget.yemek_siparis_adet,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  IconButton(onPressed: (){
                                   // context.read<YemekSepetCubit>().yemekSil(int.parse(widget.sepet_yemek_id));
                                    print("sil");
                                   
                                  }, icon: Icon(Icons.delete)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
} 
