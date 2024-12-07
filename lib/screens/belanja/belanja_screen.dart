import 'package:agrolink/models/Belanja.dart';
import 'package:agrolink/screens/belanja/detail_belanja_screen.dart';
import 'package:agrolink/screens/belanja/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';

import '../../components/belanja/belanja_card.dart';
import '../../components/search_bar.dart';

class BelanjaScreen extends StatefulWidget {
  const BelanjaScreen({super.key});

  @override
  State<BelanjaScreen> createState() => _BelanjaScreenState();
}

class _BelanjaScreenState extends State<BelanjaScreen> {
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
          'Belanja',
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
              hintText: 'Cari Sayuran',
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
                      children: belanjas.map((belanja) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailBelanjaScreen(
                                              belanja: belanja,
                                            )))
                              },
                              child: BelanjaCard(
                                name: belanja.title,
                                description: belanja.description,
                                price: belanja.harga,
                                imageUrl: belanja.imageUrl[0],
                                onAddPressed: () {
                                  // Handle add to cart action
                                  SnackBar(
                                    content: Text(
                                        "${belanja.title} masuk ke keranjang"),
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
