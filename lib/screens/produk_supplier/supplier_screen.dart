import 'package:agrolink/models/Supplier.dart';
import 'package:agrolink/screens/produk_supplier/detail_supplier_screen.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Produk Supplier',
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
              hintText: 'Cari produk suplier yang anda inginkan',
              onSearch: (query) {
                // Handle search
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
                                              supplier: supplier,
                                            )))
                              },
                              child: SupplierCard(
                                name: supplier.title,
                                description: supplier.description,
                                readyStock: supplier.readyStock,
                                price: supplier.harga,
                                imageUrl: supplier.imageUrl[0],
                                onAddPressed: () {
                                  // Handle add to cart action
                                  SnackBar(
                                    content: Text(
                                        "${supplier.title} masuk ke keranjang"),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
