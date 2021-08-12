import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/offer_controler.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/model/offer_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';

class NuMarketView extends StatefulWidget {
  @override
  _NuMarketViewState createState() => _NuMarketViewState();
}

class _NuMarketViewState extends State<NuMarketView> {
  late Future<User> _userData;
  late Future<RootOfferTree> _offerData;
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
                height: 500,
                child: FutureBuilder<RootOfferTree>(
                  future: _getFutureOfferData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<RootOfferTree> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.offers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Container(
                                    height: 200,
                                    child: Card(
                                      elevation: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 10),
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  snapshot.data!.offers[index]
                                                      .product.image),
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
                                                Text(
                                                  '\$' +
                                                      snapshot.data!
                                                          .offers[index].price
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ),
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
