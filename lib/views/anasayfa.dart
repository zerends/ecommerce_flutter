import 'package:ecommerce_app/cubit/anasayfa_cubit.dart';
import 'package:ecommerce_app/entity/sepet_yemekler.dart';
import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/views/yemek_detay.dart';
import 'package:ecommerce_app/views/yemek_sepet.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekYukle();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Food"),
      body: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (context, yemeklerListe) {
          if (yemeklerListe.isNotEmpty) {
            return GridView.builder(
              itemCount: yemeklerListe.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, indeks) {
                var yemek = yemeklerListe[indeks];
                return Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 200,
                      child: InkWell(
                        onTap: () {
                          print("asdasdd");
                          print(yemek.yemek_adi);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YemekDetaySayfa(
                                    //sepetYemekler: sepetYemekler,
                                        yemek: yemek,
                                        isim: yemek.yemek_adi,
                                        fiyat: yemek.yemek_fiyat,
                                        resim_adi:
                                      "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}", 
                                      ))).then((value) {
                            context.read<AnasayfaCubit>().yemekYukle();
                          });
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.black54,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${yemek.yemek_adi}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${yemek.yemek_fiyat}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
