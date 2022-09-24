import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      
    );
  }
  Size get preferredSize => Size.fromHeight(50);
}
