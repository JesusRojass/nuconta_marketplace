import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/offer_controler.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/controller/purchase_controller.dart';
import 'package:nuconta_marketplace/model/offer_data.dart';
import 'package:nuconta_marketplace/model/purchase_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';

class NuMarketView extends StatefulWidget {
  @override
  _NuMarketViewState createState() => _NuMarketViewState();
}

class _NuMarketViewState extends State<NuMarketView> {
  late Future<User> _userData;
  late Future<RootOfferTree> _offerData;
  late Future<PurchaseData> _purchaseData;
  @override
  void initState() {
    super.initState();
    _getFutureData().whenComplete(() {
      setState(() {});
    });
    _getFutureOfferData().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              FutureBuilder<User>(
                  future: _getFutureData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<User> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                            'https://www.medtalks.es/images/user-placeholder.jpg'),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10)),
                                      Text(
                                        snapshot.data!.name + '!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 10)),
                                Divider(
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 10, bottom: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Available Balance',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10)),
                                          Text(
                                            '\$' +
                                                snapshot.data!.balance
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Loading...'),
                        )
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    );
                  }),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Offers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              Container(
                height: 345,
                child: FutureBuilder<RootOfferTree>(
                  future: _getFutureOfferData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<RootOfferTree> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.offers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 10),
                                  child: Container(
                                    height: 200,
                                    child: Card(
                                      elevation: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Container(
                                              width: 155,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: FittedBox(
                                                child: Image.network(snapshot
                                                    .data!
                                                    .offers[index]
                                                    .product
                                                    .image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 150,
                                            width: 180,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.offers[index]
                                                      .product.name,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10)),
                                                Text(
                                                  snapshot.data!.offers[index]
                                                      .product.description,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10)),
                                                ElevatedButton(
                                                  child: Text(
                                                      '\$' +
                                                          snapshot
                                                              .data!
                                                              .offers[index]
                                                              .price
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)),
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.purple),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print(snapshot.data!
                                                        .offers[index].id);
                                                    // _doPurchase(snapshot.data!
                                                    //     .offers[index].id);
                                                    _showModalBottomSheet(
                                                        context,
                                                        snapshot
                                                            .data!
                                                            .offers[index]
                                                            .product
                                                            .name,
                                                        snapshot
                                                            .data!
                                                            .offers[index]
                                                            .product
                                                            .description,
                                                        snapshot
                                                            .data!
                                                            .offers[index]
                                                            .price,
                                                        snapshot.data!
                                                            .offers[index].id,
                                                        snapshot
                                                            .data!
                                                            .offers[index]
                                                            .product
                                                            .image);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Loading...'),
                        )
                      ];
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, String pName, String pDesc,
      int pPrice, String offId, String pImg) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .65,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: FittedBox(
                      child: Image.network(pImg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pName,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            pDesc,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: ElevatedButton(
                      child: Text('\$' + pPrice.toString(),
                          style: TextStyle(fontSize: 24)),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _doPurchase(offId);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<PurchaseData> _doPurchase(String offerId) async {
    setState(() {
      initializeGQL()
          .then((client) => {_purchaseData = commitPurchase(client, offerId)});
    });
    return _purchaseData;
  }

  Future<User> _getFutureData() async {
    setState(() {
      initializeGQL().then((client) => {_userData = fetchUserData(client)});
    });
    return _userData;
  }

  Future<RootOfferTree> _getFutureOfferData() async {
    setState(() {
      initializeGQL().then((client) => {_offerData = fetchOfferData(client)});
    });
    return _offerData;
  }
}
