import 'package:condition/screens/home/body.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
