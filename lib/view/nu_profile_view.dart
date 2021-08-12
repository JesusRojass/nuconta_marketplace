import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';

class NuProfileView extends StatefulWidget {
  @override
  _NuProfileViewState createState() => _NuProfileViewState();
}

class _NuProfileViewState extends State<NuProfileView> {
  late User userData;
  @override
  void initState() {
    super.initState();
    initializeGQL().then((client) => {
          fetchUserData(client)
              .then((userResponse) => {userData = userResponse})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
