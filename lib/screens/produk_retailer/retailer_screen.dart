import 'package:agrolink/components/search_bar.dart';
import 'package:agrolink/models/Retailer.dart';
import 'package:agrolink/screens/produk_retailer/detail_retailer_screen.dart';
import '../../components/produk_retailer/retailer_card.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';

import '../../models/shop.dart';

class RetailerScreen extends StatefulWidget {
  const RetailerScreen({super.key});

  @override
  State<RetailerScreen> createState() => _ProdukRetailerScreenState();
}

class _ProdukRetailerScreenState extends State<RetailerScreen> {
  get shop => null;

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
          // Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: Row(
          //       children: [
          //         CircleAvatar(
          //           radius: 40,
          //           backgroundImage: NetworkImage(
          //             shops[0].imageUrl[0],
          //           ),
          //         ),
          //         const SizedBox(width: 15),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               shops[0].namaToko,
          //               style: const TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             const SizedBox(height: 5),
          //             Text(
          //               shops[0].alamat,
          //               style: const TextStyle(fontSize: 14, color: Colors.grey),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          // ),
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
                              //informasi toko
                              // ListTile(
                              //   leading: CircleAvatar(
                              //     radius: 30,
                              //     backgroundImage: NetworkImage(retailer.shop.imageUrl[0]),
                              //   ),
                              //   title: Text(
                              //     retailer.shop.namaToko,
                              //     style: const TextStyle(
                              //       fontSize: 18,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              //   subtitle: Text(
                              //     retailer.shop.alamat,
                              //     style: const TextStyle(
                              //       fontSize: 14,
                              //       color: Colors.grey,
                              //     ),
                              //   ),
                              // ),
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailRetailerScreen(
                                                  retailer: retailer, shops: shop,
                                              )))
                                },
                                child: RetailerCard(
                                  name: retailer.title,
                                  description: retailer.description,
                                  readyStock: retailer.readyStock,
                                  category: retailer.category,
                                  // shopImage: retailer.shopImage[0],
                                  shopName: retailer.namaToko,
                                  price: retailer.harga,
                                  imageUrl: retailer.imageUrl[0],
                                  onAddPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "${retailer.title} masuk ke keranjang"),
                                        )
                                    );
                                  }, shopImage: 'assets/images/toko/lydiastore.png',
                                ),
                              ),
                              const Divider(),
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





