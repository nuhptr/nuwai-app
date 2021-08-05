import 'package:flutter/material.dart';
import 'package:nuwai_app/theme.dart';

class CardJobPerusahaan extends StatelessWidget {
  final String? title;
  final String? city;
  final String? image;

  CardJobPerusahaan({this.title, this.city, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16,
      ),
      height: 163,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              image!,
              fit: BoxFit.cover,
              width: 130,
              height: 90,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: poppinsSemiBold.copyWith(fontSize: 16, color: orangeColor),
            ),
          ),
          Text(
            city!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: poppinsLight.copyWith(fontSize: 14, color: grayColor),
          )
        ],
      ),
    );
  }
}
