// Libs
import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';
import 'package:nuconta_marketplace/view/nu_market_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Views
import 'bottom_menu.dart';
import 'nu_offer_view.dart';
import 'nu_profile_view.dart';

class NuMainNav extends StatefulWidget {
  @override
  _NuMainNavState createState() => _NuMainNavState();
}

class _NuMainNavState extends State<NuMainNav> {
  int _currentIndex = 0;
  late Future<User> _userData;
  List<String> _titles = ['Home', 'Offers', 'Profile'];

  @override
  void initState() {
    super.initState();
    _getFutureData().whenComplete(() {
      setState(() {
        _userData.then((data) {
          print(data.toJson());
          _saveUser(data);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      bottomNavigationBar: BottomMenuBar(_menuCallback, _currentIndex),
      body: SafeArea(child: _callPage(this._currentIndex)),
    );
  }

  // This switches the view from the body of this view
  Widget _callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return NuMarketView();
      case 1:
        return NuOfferView();
      case 2:
        return NuProfileView();
      default:
        return NuMarketView();
    }
  }

  // This handles bottom nav bar clicks
  void _menuCallback(int selectedIndex) {
    setState(() {
      this._currentIndex = selectedIndex;
    });
  }

  Future<Null> _saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('id', user.id);
    prefs.setString('name', user.name);
    prefs.setInt('balance', user.balance);
  }

  Future<User> _getFutureData() async {
    setState(() {
      initializeGQL().then((client) => {_userData = fetchUserData(client)});
    });
    return _userData;
  }
}
