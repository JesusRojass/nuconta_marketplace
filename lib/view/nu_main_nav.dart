// Libs
import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/view/nu_market_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NuConta Marketplace'),
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
}

class NuOfferrView {}
