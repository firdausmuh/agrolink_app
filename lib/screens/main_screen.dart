import 'package:agrolink/screens/home/home_screen.dart';
import 'package:agrolink/screens/keranjang/keranjang_screen.dart';
import 'package:agrolink/screens/profile/profile_screen.dart';
import 'package:agrolink/screens/riwayat_transaksi/riwayat_screen.dart';
import 'package:agrolink/screens/toko/toko_screen.dart';
import 'package:agrolink/screens/transaksi/riwayat_transaksi_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  static const Color selectedGreen = Colors.green;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: selectedGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.shopping_bag, color: Colors.white),
      ),
      label: 'Toko',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'Transaksi',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  final List<Widget> _listWidget = [
    HomeScreen(),
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
