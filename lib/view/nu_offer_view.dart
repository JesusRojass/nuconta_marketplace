import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/offer_controler.dart';
import 'package:nuconta_marketplace/model/offer_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';

class NuOfferView extends StatefulWidget {
  @override
  _NuOfferViewState createState() => _NuOfferViewState();
}

class _NuOfferViewState extends State<NuOfferView> {
  late Future<RootOfferTree> _offerData;
  @override
  void initState() {
    super.initState();
    _getFutureOfferData().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Offer"),
      ),
    );
  }

  Future<void> _getFutureOfferData() async {
    setState(() {
      initializeGQL().then((client) => {_offerData = fetchOfferData(client)});
    });
  }
}
