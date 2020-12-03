import 'package:condition/constants.dart';
import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantityInt = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        outlineButton(
          icon: Icons.remove,
          press: () {
            if (quantityInt > 1) {
              setState(() {
                quantityInt -= 1;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            quantityInt.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        outlineButton(
          icon: Icons.add,
          press: () {
            setState(() {
              quantityInt += 1;
            });
          },
        ),
      ],
    );
  }

  SizedBox outlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Icon(icon),
        onPressed: press,
      ),
    );
  }
}
