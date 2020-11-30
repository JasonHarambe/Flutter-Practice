import 'package:doctor/components/firstRow.dart';
import 'package:doctor/components/secondRow.dart';
import 'package:doctor/components/infoRow.dart';
import 'package:flutter/material.dart';

import 'components/listItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'EXPLORE',
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'Montserrat',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          iconSize: 17.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 17.0,
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        children: <Widget>[
          Container(
            height: 125.0,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.orange,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'Add To',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15.0),
                ListItem('assets/chris.jpg', 'Chris', true),
                SizedBox(width: 15.0),
                ListItem('assets/hugh.jpg', 'Hugh', false),
                SizedBox(width: 15.0),
                ListItem('assets/johnnydepp.jpg', 'Depp', true),
                SizedBox(width: 15.0),
                ListItem('assets/tomcruise.jpg', 'Tom', true),
              ],
            ),
          ),
          FirstRow(
            'assets/cone.jpeg',
            'assets/letter.jpeg',
            'assets/chris.jpg',
          ),
          SizedBox(height: 10.0),
          SecondRow(
            'assets/window.jpeg',
            'assets/cactus.jpeg',
            'assets/johnnydepp.jpg',
          ),
          SizedBox(height: 10.0),
          InfoRow(
            'assets/tomcruise.jpg',
            'assets/chris.jpg',
          ),
          FirstRow(
            'assets/cone.jpeg',
            'assets/letter.jpeg',
            'assets/chris.jpg',
          ),
          SizedBox(height: 10.0),
          SecondRow(
            'assets/window.jpeg',
            'assets/cactus.jpeg',
            'assets/johnnydepp.jpg',
          ),
          SizedBox(height: 10.0),
          InfoRow(
            'assets/tomcruise.jpg',
            'assets/chris.jpg',
          ),
        ],
      ),
    );
  }
}

class ThirdRow {}
