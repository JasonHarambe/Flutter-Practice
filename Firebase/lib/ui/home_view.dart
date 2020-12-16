import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/net/api_method.dart';
import 'package:firebase/ui/add_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;

  @override
  void initState() {
    updateValues();
  }

  updateValues() async {
    bitcoin = await getPrice('bitcoin');
    ethereum = await getPrice('ethereum');
    tether = await getPrice('tether');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    getValue(String id, double amount) {
      if (id == 'bitcoin') {
        return (bitcoin * amount).toStringAsFixed(5);
      } else if (id == 'ethereum') {
        return (ethereum * amount).toStringAsFixed(5);
      } else {
        return (tether * amount).toStringAsFixed(5);
      }
    }

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: StreamBuilder(
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Container(
                      child: Row(
                    children: [
                      Text('Coin: ${(document.id).toUpperCase()}'),
                      SizedBox(width: width / 30),
                      Text(
                          'Price: ${getValue(document.id, document.data()['Amount'])}'),
                    ],
                  ));
                }).toList(),
              );
            },
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .collection('Coins')
                .snapshots(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddView(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
