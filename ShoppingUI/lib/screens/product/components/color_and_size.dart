import 'package:condition/constants.dart';
import 'package:condition/models/Product.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatefulWidget {
  const ColorAndSize({
    @required this.product,
    Key key,
  }) : super(key: key);

  final Product product;

  @override
  _ColorAndSizeState createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  List<Color> colors = [
    Color(0xFF356C95),
    Color(0xFFF8C078),
    Color(0xFFA29B9B),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) => colorDot(index),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Size'),
              Text(
                '${widget.product.size}',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget colorDot(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPaddin / 4,
          right: kDefaultPaddin / 2,
        ),
        height: 24,
        width: 24,
        padding: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedIndex == index ? colors[index] : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors[index],
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
