import 'package:flutter/material.dart';

import '../models/rating.dart';

class RatingCard extends StatelessWidget {
  Rating rating;
  RatingCard({required this.rating, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _height = _size.height;
    var _width = _size.width;
    return Container(
      width: _width / 8.5,
      height: _height /30,
      decoration: BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating.rate.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
          Icon(
            Icons.star,
            color: Color(0Xfffdd14b),
            size: _width / 26,
          ),
        ],
      ),
    );
  }
}
