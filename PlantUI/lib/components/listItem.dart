import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imgPath;
  final String name;
  final bool available;

  const ListItem(this.imgPath, this.name, this.available);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 7.0),
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.0),
            available
                ? Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.orange,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
