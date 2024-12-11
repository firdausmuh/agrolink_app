import 'package:agrolink/components/produk_distributor/distributor_card.dart';
import 'package:agrolink/components/search_bar.dart';
import 'package:agrolink/models/Distributor.dart';
import 'package:agrolink/screens/produk_distributor/detail_distributor_screen.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';

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
                                    SnackBar(
                                      content: Text(
                                          "${distributor.title} masuk ke keranjang"),
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


