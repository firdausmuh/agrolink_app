import 'package:agrolink/components/produk_produsen/produsen_card.dart';
import 'package:agrolink/components/produk_retailer/retailer_card.dart';
import 'package:agrolink/models/Retailer.dart';
import 'package:agrolink/screens/produk_produsen/detail_produsen_screen.dart';
import 'package:agrolink/screens/produk_retailer/detail_retailer_screen.dart';
import 'package:flutter/material.dart';
import '../../models/Produsen.dart';
import '../keranjang/checkout_screen.dart';
import '../profile/profile_screen.dart';

class RetailerHome extends StatefulWidget {
  const RetailerHome({Key? key}) : super(key: key);

  @override
  _RetailerHomeState createState() => _RetailerHomeState();
}

class _RetailerHomeState extends State<RetailerHome> {
  String searchQuery = ""; // Menyimpan query pencarian

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan query
    List<produk_retailer> filteredRetailers = retailers.where((retailer) {
      return retailer.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey Muhamad Firdaus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selamat datang di Agrolink',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
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
                backgroundImage: const AssetImage('assets/images/profile2.png'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/iklan.png',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        'assets/images/banner2.png',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Produk Retailer...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query; // Perbarui query pencarian
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(
                        color: Colors.yellow,
                        width: 6,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.deepOrange,
                      size: 24,
                    ),
                  ),
                  onPressed: () {
                    print('Filter button pressed');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Produk-produk Retailer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Buat momen istimewamu belanja produk Retailer',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
                child: filteredRetailers.isEmpty
                    ? Center(
                  child: Text(
                    'Produk tidak ditemukan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: filteredRetailers.length,
                  itemBuilder: (context, index) {
                    final retailer = filteredRetailers[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailRetailerScreen(
                                          retailer: retailer,
                                        )))
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
                                    builder: (context) => CheckoutScreen()),
                              );
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
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}

