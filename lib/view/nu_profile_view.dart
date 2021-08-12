import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';

class NuProfileView extends StatefulWidget {
  @override
  _NuProfileViewState createState() => _NuProfileViewState();
}

class _NuProfileViewState extends State<NuProfileView> {
  late Future<User> _userData;
  @override
  void initState() {
    super.initState();
    _getFutureData().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
}
