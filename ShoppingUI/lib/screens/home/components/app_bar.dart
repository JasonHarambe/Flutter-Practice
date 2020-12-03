import 'package:condition/constants.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    // leading: IconButton(
    //   icon: Icon(Icons.arrow_back),
    //   onPressed: () {},
    //   color: kTextColor,
    // ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
        ),
        onPressed: () {},
        color: kTextColor,
      ),
      IconButton(
        icon: Icon(
          Icons.shopping_cart_outlined,
        ),
        onPressed: () {},
        color: kTextColor,
      )
    ],
  );
}
