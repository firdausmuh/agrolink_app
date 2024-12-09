import 'package:agrolink/components/search_bar.dart';
import 'package:agrolink/models/Retailer.dart';
import 'package:agrolink/screens/produk_retailer/detail_retailer_screen.dart';
import '../../components/produk_retailer/retailer_card.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';

class RetailerScreen extends StatefulWidget {
  const RetailerScreen({super.key});

  @override
  State<RetailerScreen> createState() => _ProdukRetailerScreenState();
}

class _ProdukRetailerScreenState extends State<RetailerScreen> {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black)
        ),
        title: const Text(
            'Produk Retailer',
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
              hintText: 'Cari Produk Retailer yang diinginkan',
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
                        children: retailers.map((retailer) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailRetailerScreen(
                                                  retailer: retailer
                                              )))
                                },
                                child: RetailerCard(
                                  name: retailer.title,
                                  description: retailer.description,
                                  readyStock: retailer.readyStock,
                                  price: retailer.harga,
                                  imageUrl: retailer.imageUrl[0],
                                  onAddPressed: () {
                                    // Handle add to cart action
                                    SnackBar(
                                      content: Text(
                                          "${retailer.title} masuk ke keranjang"),
                                    );
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
}

