import 'package:flutter/material.dart';
import 'package:nuwai_app/theme.dart';

class ContentProfile extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Function()? ontap;

  ContentProfile({this.text, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey.shade100,
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: poppinsMedium.copyWith(fontSize: 16, color: orangeColor),
            ),
            IconButton(
              onPressed: (ontap != null) ? ontap! : null,
              icon: icon!,
              iconSize: 35,
              splashColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
