import 'package:agrolink/components/produk_distributor/distributor_card.dart';
import 'package:agrolink/components/search_bar.dart';
import 'package:agrolink/models/Distributor.dart';
import 'package:agrolink/screens/produk_distributor/detail_distributor_screen.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../keranjang/keranjang_screen.dart';

import '../keranjang/checkout_screen.dart';

class DistributorScreen extends StatefulWidget {
  const DistributorScreen({super.key});

  @override
  State<DistributorScreen> createState() => _ProdukDistributorScreenState();
}

class _ProdukDistributorScreenState extends State<DistributorScreen> {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black)
        ),
        title: const Text(
          'Produk Distributor',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteBelanjaScreen()))
                },
                icon: Icon(Icons.favorite, color: Colors.red.withOpacity(0.6),)),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBarWithController(
              hintText: 'Cari Produk Distributor yang diinginkan',
              onSearch: (query) {
                //Handle Search
                print('Searching for: $query');
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children: distributors.map((distributor) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailDistributorScreen(
                                                  distributor: distributor
                                              )
                                      )
                                  )
                                },
                                child: DistributorCard(
                                  name: distributor.title,
                                  description: distributor.description,
                                  readyStock: distributor.readyStock,
                                  category: distributor.category,
                                  price: distributor.harga,
                                  imageUrl: distributor.imageUrl[0],
                                  onAddPressed: () {
                                    // Handle add to cart action
                                    _addToCart(distributors);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }).toList()
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Fungsi untuk menambahkan produk ke keranjang
  void _addToCart(distributors) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Ambil daftar item keranjang yang sudah ada
    List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

    // Buat string untuk produk
    String newItem = '${distributors.title},${distributors.description},${distributors.category},${distributors.harga},${distributors.imageUrl[0]},${distributors.rating},1'; // Menambahkan kuantitas default 1

    // Tambahkan item baru ke keranjang
    cartItemsString.add(newItem); // Simpan sebagai string

    // Simpan kembali ke SharedPreferences
    await prefs.setStringList('cart_items', cartItemsString);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${distributors.title} masuk ke keranjang"),
        backgroundColor: Colors.green,
      ),
    );
  }
}


