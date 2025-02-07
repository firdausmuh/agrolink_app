import 'package:agrolink/models/Supplier.dart';
import 'package:agrolink/screens/produk_supplier/detail_supplier_screen.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/produk_supplier/supplier_card.dart';
import '../../components/search_bar.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  State<SupplierScreen> createState() => _ProdukSupplierScreenState();
}

class _ProdukSupplierScreenState extends State<SupplierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text(
          'Produk Supplier',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteBelanjaScreen()))
                },
                icon: Icon(Icons.favorite, color: Colors.red.withOpacity(0.6))),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBarWithController(
              hintText: 'Cari Produk Produsen yang diinginkan',
              onSearch: (query) {
                // Handle Search
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
                        children: suppliers.map((supplier) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailSupplierScreen(
                                                  supplier: supplier)))
                                },
                                child: SupplierCard(
                                  name: supplier.title,
                                  description: supplier.description,
                                  readyStock: supplier.readyStock,
                                  category: supplier.category,
                                  price: supplier.harga,
                                  imageUrl: supplier.imageUrl[0],
                                  onAddPressed: () {
                                    _addToCart(supplier); // Panggil fungsi untuk menambahkan ke keranjang
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }).toList())
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
  void _addToCart(suppliers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Ambil daftar item keranjang yang sudah ada
    List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

    // Buat string untuk produk
    String newItem = '${suppliers.title},${suppliers.description},${suppliers.category},${suppliers.size},${suppliers.harga},${suppliers.imageUrl[0]},${suppliers.rating},1'; // Menambahkan kuantitas default 1

    // Tambahkan item baru ke keranjang
    cartItemsString.add(newItem); // Simpan sebagai string

    // Simpan kembali ke SharedPreferences
    await prefs.setStringList('cart_items', cartItemsString);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${suppliers.title} masuk ke keranjang"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
