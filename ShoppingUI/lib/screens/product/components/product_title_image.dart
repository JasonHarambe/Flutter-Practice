import 'package:condition/constants.dart';
import 'package:condition/models/Product.dart';
import 'package:flutter/material.dart';

class ProductTitleImage extends StatelessWidget {
  const ProductTitleImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aristocrat Hand Bag',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Price',
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${product.price}',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Image.asset(product.image, fit: BoxFit.fitWidth),
              ),
            ],
          )
        ],
      ),
    );
  }
}
