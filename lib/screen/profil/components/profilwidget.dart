import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

class profilWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const profilWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: siyah,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                    color: siyah, fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: siyah.withOpacity(.4),
            size: 20,
          )
        ],
      ),
    );
  }
}
