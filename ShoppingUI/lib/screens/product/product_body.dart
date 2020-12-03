import 'package:condition/constants.dart';
import 'package:condition/models/Product.dart';

import 'package:flutter/material.dart';

import 'components/components.dart';

class ProductBody extends StatelessWidget {
  final Product product;

  const ProductBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    child: Column(
                      children: [
                        ColorAndSize(product: product),
                        SizedBox(height: kDefaultPaddin),
                        ProductDescription(product: product),
                        SizedBox(height: kDefaultPaddin),
                        CounterWithLove(product: product),
                        SizedBox(height: kDefaultPaddin),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleImage(product: product),
                ],
              )),
        ],
      ),
    );
  }
}
