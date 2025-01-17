// import 'package:agrolink/components/produk_produsen/produsen_card.dart';
// import 'package:agrolink/components/search_bar.dart';
// import 'package:agrolink/models/Produsen.dart';
// import 'package:agrolink/screens/keranjang/checkout_screen.dart';
// import 'package:agrolink/screens/produk_produsen/detail_produsen_screen.dart';
// import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
// import 'package:flutter/material.dart';
//
// class ProdusenScreen extends StatefulWidget {
//   const ProdusenScreen({super.key});
//
//   @override
//   State<ProdusenScreen> createState() => _ProdukProdusenScreenState();
// }
//
// class _ProdukProdusenScreenState extends State<ProdusenScreen> {
//   @override
//   Widget build(BuildContext contex) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leadingWidth: 50,
//         titleSpacing: 0,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back, color: Colors.black)
//         ),
//         title: const Text(
//           'Produk Produsen',
//           style: TextStyle(
//               color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: IconButton(
//                 onPressed: () => {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => FavoriteBelanjaScreen()))
//                 },
//                 icon: Icon(Icons.favorite, color: Colors.red.withOpacity(0.6),)),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: SearchBarWithController(
//               hintText: 'Cari Produk Produsen yang diinginkan',
//               onSearch: (query) {
//                 //Handle Search
//                 print('Searching for: $query');
//               },
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                         children: produsens.map((produsen) {
//                           return Column(
//                             children: [
//                               InkWell(
//                                 onTap: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               DetailProdusenScreen(
//                                                   produsen: produsen
//                                               )))
//                                 },
//                                 child: ProdusenCard(
//                                   name: produsen.title,
//                                   description: produsen.description,
//                                   readyStock: produsen.readyStock,
//                                   category: produsen.category,
//                                   price: produsen.harga,
//                                   imageUrl: produsen.imageUrl[0],
//                                   onAddPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) => CheckoutScreen()),
//                                     );
//                                     // Handle add to cart action
//                                     SnackBar(
//                                       content: Text(
//                                           "${produsen.title} masuk ke keranjang"),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               )
//                             ],
//                           );
//                         }).toList()
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

//update produsen screen

import 'package:agrolink/components/produk_produsen/produsen_card.dart';
import 'package:agrolink/components/search_bar.dart';
import 'package:agrolink/models/Produsen.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:agrolink/screens/produk_produsen/detail_produsen_screen.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdusenScreen extends StatefulWidget {
  const ProdusenScreen({super.key});

  @override
  State<ProdusenScreen> createState() => _ProdukProdusenScreenState();
}

class _ProdukProdusenScreenState extends State<ProdusenScreen> {
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
          'Produk Produsen',
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
                        children: produsens.map((produsen) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailProdusenScreen(
                                                  produsen: produsen)))
                                },
                                child: ProdusenCard(
                                  name: produsen.title,
                                  description: produsen.description,
                                  readyStock: produsen.readyStock,
                                  category: produsen.category,
                                  price: produsen.harga,
                                  imageUrl: produsen.imageUrl[0],
                                  onAddPressed: () {
                                    _addToCart(produsen); // Panggil fungsi untuk menambahkan ke keranjang
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
  void _addToCart(produsens) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Ambil daftar item keranjang yang sudah ada
    List<String>? cartItemsString = prefs.getStringList('cart_items') ?? [];

    // Buat string untuk produk
    String newItem = '${produsens.title},${produsens.description},${produsens.category},${produsens.harga},${produsens.imageUrl[0]},${produsens.rating},1'; // Menambahkan kuantitas default 1

    // Tambahkan item baru ke keranjang
    cartItemsString.add(newItem); // Simpan sebagai string

    // Simpan kembali ke SharedPreferences
    await prefs.setStringList('cart_items', cartItemsString);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${produsens.title} masuk ke keranjang"),
        backgroundColor: Colors.green,
      ),
    );
  }

}




