// Libs
import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/profile_data.dart';
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:nuconta_marketplace/utils/graph_ql_utils.dart';
import 'package:nuconta_marketplace/utils/user_prefs_helper.dart';
import 'package:nuconta_marketplace/view/about_me.dart';
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
          saveUser(data).whenComplete(() {
            _getFutureData();
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Reset', 'About'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
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

  void handleClick(String value) {
    switch (value) {
      case 'Reset':
        _initializeUserInApp();
        break;
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutMe()),
        );
        break;
    }
  }

  void _initializeUserInApp() {
    _getFutureData().whenComplete(() {
      setState(() {
        _userData.then((data) {
          print(data.toJson());
          saveUser(data).whenComplete(() {
            _getFutureData();
          });
        });
      });
    });
  }

  // This handles bottom nav bar clicks
  void _menuCallback(int selectedIndex) {
    setState(() {
      this._currentIndex = selectedIndex;
    });
  }

  Future<User> _getFutureData() async {
    setState(() {
      initializeGQL().then((client) => {_userData = fetchUserData(client)});
    });
    return _userData;
  }
}
