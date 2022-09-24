import 'package:ecommerce_app/cubit/anasayfa_cubit.dart';
import 'package:ecommerce_app/cubit/yemek_detay_detay.dart';
import 'package:ecommerce_app/cubit/yemek_sepet_cubit.dart';
import 'package:ecommerce_app/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YemekDetayCubit()),
       BlocProvider(create: (context)=> YemekSepetCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
          
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
