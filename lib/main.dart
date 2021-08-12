// Libs
import 'package:flutter/material.dart';
// Views
import 'view/nu_main_nav.dart';

void main() async {
  runApp(NuMarketMain());
}

// ignore: must_be_immutable
class NuMarketMain extends StatefulWidget {
  @override
  _NuMarketMainState createState() => _NuMarketMainState();
}

class _NuMarketMainState extends State<NuMarketMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuConta Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: NuMainNav(),
    );
  }
}
