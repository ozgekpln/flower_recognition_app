import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

class ButtonluBaslik extends StatelessWidget {
  const ButtonluBaslik({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding1),
      child: Row(
        children: [
          alticiziliYazi(
            text: title,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: press,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black;
                }
                return renk1;
              }),
            ),
            child: const Text("more", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class alticiziliYazi extends StatelessWidget {
  const alticiziliYazi({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: padding1, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 7,
              color: renk1.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
