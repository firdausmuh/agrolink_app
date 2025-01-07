import 'package:agrolink/screens/home/customer_home.dart';
import 'package:agrolink/screens/home/distributor_home.dart';
import 'package:agrolink/screens/home/home_screen.dart';
import 'package:agrolink/screens/home/produsen_home.dart';
import 'package:agrolink/screens/home/retailer_home.dart';
import 'package:agrolink/screens/home/supplier_home.dart';
import 'package:agrolink/screens/keranjang/keranjang_screen.dart';
import 'package:agrolink/screens/produk_distributor/distributor_screen.dart';
import 'package:agrolink/screens/produk_produsen/produsen_screen.dart';
import 'package:agrolink/screens/produk_retailer/retailer_screen.dart';
import 'package:agrolink/screens/produk_supplier/supplier_screen.dart';
import 'package:agrolink/screens/profile/profile_screen.dart';
import 'package:agrolink/screens/riwayat_transaksi/riwayat_screen.dart';
import 'package:agrolink/screens/toko/toko_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  static const Color selectedGreen = Colors.green;
  late Future<Widget> _homeScreenFuture;

  @override
  void initState() {
    super.initState();
    _homeScreenFuture = homeScreenArranger();
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, size: 28), // Ikon diperbesar
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined, size: 28), // Ikon diperbesar
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0), // Menyesuaikan posisi naik
        child: Container(
          padding: const EdgeInsets.all(12), // Memberikan padding lebih besar
          decoration: const BoxDecoration(
            color: selectedGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.shopping_bag,
              color: Colors.white, size: 30), // Ikon diperbesar
        ),
      ),
      label: 'Toko',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt, size: 28), // Ikon diperbesar
      label: 'Transaksi',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline, size: 28), // Ikon diperbesar
      label: 'Profile',
    ),
  ];

  // update from faiz
  final List<Widget> _listWidget = [
    HomeScreen(),
    // const SupplierHome(),
    // const ProdusenHome(),
    // const DistributorHome(),
    // RetailerHome(),
    // CustomerHome(),
    const KeranjangScreen(),
    const TokoScreen(),
    const RiwayatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _homeScreenFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildMainScreen(snapshot.data ?? HomeScreen());
        }
      },
    );
  }

  Widget _buildMainScreen(Widget homeScreen) {
    final List<Widget> _listWidget = [
      homeScreen,
      const KeranjangScreen(),
      const TokoScreen(),
      const RiwayatScreen(),
      const ProfileScreen(),
    ];
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: _bottomNavIndex,
  //       selectedItemColor: selectedGreen,
  //       unselectedItemColor: Colors.grey,
  //       selectedFontSize: 12,
  //       unselectedFontSize: 12,
  //       showSelectedLabels: true,
  //       showUnselectedLabels: true,
  //       items: _bottomNavBarItems,
  //       onTap: (selected) {
  //         setState(() {
  //           _bottomNavIndex = selected;
  //         });
  //       },
  //     ),
  //     body: SafeArea(child: _listWidget[_bottomNavIndex]),
  //   );
  // }
}

Future<Widget> homeScreenArranger() async {
  final prefs = await SharedPreferences.getInstance();
  String? role = prefs.getString('role');

  late Widget defaultHomeScreen;
  if (role == 'Supplier') {
    defaultHomeScreen = const RetailerScreen();
  } else if (role == 'Produsen') {
    defaultHomeScreen = const SupplierScreen();
  } else if (role == 'Distributor') {
    defaultHomeScreen = const ProdusenScreen();
  } else if (role == 'Retailer') {
    defaultHomeScreen = const DistributorScreen();
  } else {
    defaultHomeScreen = HomeScreen();
  }
  return defaultHomeScreen;
}
