import 'dart:async';
import 'package:agrolink/screens/produk_retailer/detail_retailer_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/produk_retailer/retailer_card.dart';
import '../../models/Retailer.dart';
import '../keranjang/checkout_screen.dart';
import '../profile/profile_screen.dart';

class RetailerHome extends StatefulWidget {
  const RetailerHome({Key? key}) : super(key: key);

  @override
  _RetailerHomeState createState() => _RetailerHomeState();
}

class _RetailerHomeState extends State<RetailerHome> {
  String searchQuery = ""; // Menyimpan query pencarian
  late TextEditingController _searchController;
  Timer? _debounce; // Timer untuk debounce search query

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Bersihkan debounce timer
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    // Batalkan debounce sebelumnya jika ada
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Pastikan hanya mencari jika panjang query >= 3 karakter
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.length >= 3) {
        setState(() {
          searchQuery = query;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUsername(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          String? username = snapshot.data ?? "User";

          // Filter data berdasarkan query
          List<produk_retailer> filteredRetailers = retailers.where((retailer) {
            return retailer.title.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Hello ${username}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.waving_hand,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            Text('Selamat datang di Aplikasi Agrolink')
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileScreen()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const AssetImage('assets/images/profile/profile2.png'),
                        ),
                      ),
                    ],
                  ),
                  // Banner Section
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'assets/images/iklan/BannerAgrolink.png',
                              width: 400,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/iklan/BannerRetailer.png',
                            width: 400,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search and Filter Section
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Cari Produk retailer...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          onChanged: _onSearchChanged, // Panggil metode debounce
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bagian Header Produk
                          const Text(
                            'Produk-produk Retailer',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Buat momen istimewamu belanja produk retailer',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),

                          // ListView untuk produk
                          filteredRetailers.isEmpty
                              ? const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Produk tidak ditemukan',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          )
                              : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true, // Agar ListView mengikuti tinggi konten
                            itemCount: filteredRetailers.length,
                            itemBuilder: (context, index) {
                              final retailer = filteredRetailers[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailRetailerScreen(retailer: retailer),
                                      ),
                                    );
                                  },
                                  child: RetailerCard(
                                    name: retailer.title,
                                    description: retailer.description,
                                    readyStock: retailer.readyStock,
                                    category: retailer.category,
                                    price: retailer.harga,
                                    imageUrl: retailer.imageUrl[0],
                                    onAddPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CheckoutScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  // Logic untuk mendapatkan username
  Future<String?> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}

