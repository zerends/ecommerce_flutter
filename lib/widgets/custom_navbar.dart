import 'package:ecommerce_app/cubit/anasayfa_cubit.dart';
import 'package:ecommerce_app/cubit/yemek_detay_detay.dart';
import 'package:ecommerce_app/entity/yemek.dart';
import 'package:ecommerce_app/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Anasayfa()))
                      .then((value) {
                    context.read<YemekDetayCubit>().yemekYukle();
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
