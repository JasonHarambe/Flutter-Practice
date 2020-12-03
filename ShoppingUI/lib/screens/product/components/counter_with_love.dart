import 'package:condition/models/Product.dart';
import 'package:condition/screens/product/components/quantity_counter.dart';
import 'package:flutter/material.dart';

class CounterWithLove extends StatelessWidget {
  const CounterWithLove({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QuantityCounter(),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: product.color,
          ),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
