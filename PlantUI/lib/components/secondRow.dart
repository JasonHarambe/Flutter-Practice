import 'package:flutter/material.dart';

class SecondRow extends StatelessWidget {
  final String imgPath;
  final String img2Path;
  final String avatarImg;

  SecondRow(this.imgPath, this.img2Path, this.avatarImg);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 250.0,
            width: (MediaQuery.of(context).size.width - 30) / 2,
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(img2Path),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            height: 250.0,
            width: (MediaQuery.of(context).size.width - 30) / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'I like the way the placed item looks amazing...',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(avatarImg),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mona Hall',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          '10.51PM',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
