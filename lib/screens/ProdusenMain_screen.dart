import 'package:agrolink/screens/profile/profile_screen.dart';
import 'package:agrolink/screens/riwayat_transaksi/riwayat_screen.dart';
import 'package:agrolink/screens/toko/toko_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/produsen_home.dart';
import 'keranjang/keranjang_screen.dart';

class ProdusenMainScreen extends StatefulWidget {
  const ProdusenMainScreen({super.key});

  @override
  State<ProdusenMainScreen> createState() => _ProdusenMainScreenState();
}

class _ProdusenMainScreenState extends State<ProdusenMainScreen> {
  int _bottomNavIndex = 0;
  static const Color selectedGreen = Colors.green;

  // Menentukan HomeScreen untuk produsen
  //late Widget _homeScreen = ProdusenHome();

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, size: 28),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined, size: 28),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: selectedGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.shopping_bag, color: Colors.white, size: 30),
        ),
      ),
      label: 'Toko',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt, size: 28),
      label: 'Transaksi',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline, size: 28),
      label: 'Profile',
    ),
  ];

  final List<Widget> _listWidget = [
    ProdusenHome(),
    const KeranjangScreen(),
    const TokoScreen(),
    const RiwayatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavIndex,
        selectedItemColor: selectedGreen,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
      body: SafeArea(child: _listWidget[_bottomNavIndex]),
    );
  }
}
