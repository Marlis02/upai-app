import 'package:ctmax_upai/pages/main_page.dart';
import 'package:ctmax_upai/pages/orders_page.dart';
import 'package:ctmax_upai/pages/profile_page.dart';
import 'package:ctmax_upai/pages/qr_code_page.dart';
import 'package:ctmax_upai/pages/search_page.dart';
import 'package:flutter/material.dart';

enum NavigationItem { orders, qr, profile, search, main }

class ItemInfoHolder {
  final Icon? icon;
  final Icon? activeIcon;
  final String? label;

  const ItemInfoHolder({this.icon, this.label, this.activeIcon});
}

class MainLayout extends StatefulWidget {
  static const routeName = '';
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  static const navigationWidgetMapping = {
    NavigationItem.main: ItemInfoHolder(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_rounded),
      label: 'Главная',
    ),
    NavigationItem.search: ItemInfoHolder(
      icon: Icon(Icons.search_rounded),
      activeIcon: Icon(Icons.search_rounded),
      label: 'Поиск',
    ),
    NavigationItem.qr: ItemInfoHolder(
      icon: Icon(Icons.qr_code_rounded),
      activeIcon: Icon(Icons.qr_code_rounded),
      label: 'QR',
    ),
    NavigationItem.orders: ItemInfoHolder(
      icon: Icon(Icons.view_timeline_outlined),
      activeIcon: Icon(Icons.view_timeline_rounded),
      label: 'Заказы',
    ),
    NavigationItem.profile: ItemInfoHolder(
      icon: Icon(Icons.person_outlined),
      activeIcon: Icon(Icons.person),
      label: 'Профиль',
    ),
  };
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon getActiveIcon(index) {
    return navigationWidgetMapping.values.elementAt(index).icon!;
  }

  Widget _compileTabWidget(NavigationItem item) {
    return switch (item) {
      NavigationItem.orders => const OrdersPage(),
      NavigationItem.qr => const QrCodePage(),
      NavigationItem.search => const SearchPage(),
      NavigationItem.profile => const ProfilePage(),
      _ => const MainPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var selectedTabItem = navigationWidgetMapping.keys.toList()[_selectedIndex];
    return Scaffold(
      body: _compileTabWidget(selectedTabItem),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 11,
        selectedFontSize: 12,
        enableFeedback: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: navigationWidgetMapping.values
            .map((e) => BottomNavigationBarItem(
                icon: e.icon!,
                activeIcon: e.activeIcon,
                label: e.label!,
                tooltip: e.label!))
            .toList(),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        iconSize: 25,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
