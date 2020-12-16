import 'package:firebase/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    'bitcoin',
    'tether',
    'ethereum',
  ];

  String dropDownDefault = 'bitcoin';
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Material(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropDownDefault,
              onChanged: (String value) {
                setState(() {
                  dropDownDefault = value;
                });
              },
              items: coins.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              width: width / 1.3,
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Coin Amount',
                ),
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              width: width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: MaterialButton(
                onPressed: () async {
                  await addCoin(dropDownDefault, _amountController.text);
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            )
          ],
        ));
  }
}
