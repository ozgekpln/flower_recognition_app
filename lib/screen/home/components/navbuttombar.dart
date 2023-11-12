import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class bottomnavigationbar extends StatelessWidget {
  const bottomnavigationbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: renk1.withOpacity(0.3))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.black54,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.black54,
              size: 30.0,
            ),
          ),
          IconButton(
            splashColor: renk1,
            disabledColor: Colors.black54,
            onPressed: () {},
            icon: const Icon(
              Icons.nature,
              color: Colors.black54,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.black54,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
