import 'package:agrolink/components/produk_produsen/produsen_card.dart';
import 'package:agrolink/screens/produk_produsen/detail_produsen_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/Produsen.dart';
import '../keranjang/checkout_screen.dart';
import '../profile/profile_screen.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  String searchQuery = ""; // Menyimpan query pencarian

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsername(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          String? username = snapshot.data ?? "User";
          List<produk_produsen> filteredProdusens = produsens.where((produsen) {
            return produsen.title.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          return Padding(
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
                          Text(
                            'Hello $username',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          const Text(
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
                        backgroundImage: const AssetImage('assets/images/profile/profile2.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Banner Section
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
                            'assets/images/iklan/BannerAgrolink.png',
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
                            'assets/images/iklan/bannercashback.png',
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
                            'assets/images/iklan/BannerCustomer.png',
                            width: 400,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Search and Filter Section
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari Produk Customer...',
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
                // Produk Section
                const Text(
                  'Produk-produk supplier',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Buat momen istimewamu belanja produk supplier',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                // List Produk
                Expanded(
                  child: filteredProdusens.isEmpty
                      ? const Center(
                    child: Text(
                      'Produk tidak ditemukan',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: filteredProdusens.length,
                    itemBuilder: (context, index) {
                      final produsen = filteredProdusens[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProdusenScreen(
                                        produsen: produsen,
                                      )))
                            },
                            child: ProdusenCard(
                              name: produsen.title,
                              description: produsen.description,
                              readyStock: produsen.readyStock,
                              category: produsen.category,
                              price: produsen.harga,
                              imageUrl: produsen.imageUrl[0],
                              onAddPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutScreen()),
                                );
                                // Handle add to cart action
                                SnackBar(
                                  content: Text(
                                      "${produsen.title} masuk ke keranjang"),
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
                  ),
                ),
              ],
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

