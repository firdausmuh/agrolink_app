import 'package:agrolink/components/layanan_box.dart';
import 'package:agrolink/screens/informasi/informasi_screen.dart';
import 'package:agrolink/screens/produk_distributor/distributor_screen.dart';
import 'package:agrolink/screens/produk_produsen/produsen_screen.dart';
import 'package:agrolink/screens/produk_retailer/retailer_screen.dart';
import 'package:agrolink/screens/produk_supplier/supplier_screen.dart';
import 'package:agrolink/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/produk_produsen/produsen_card.dart';
import '../../models/Produsen.dart';
import '../produk_produsen/detail_produsen_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsername(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          String? username = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Hello ${username}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.waving_hand,
                                color: Colors.green,
                              )
                            ],
                          ),
                          Text('Selamat datang di Aplikasi Agrolink')
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the profile page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
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
              ),

              // Section iklan
              const SizedBox(height: 8),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
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

              const SizedBox(height: 20),

              // Content Produk
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section paket layanan
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Layanan Pertanian',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SupplierScreen()),
                                    ),
                                    child: const LayananBox(
                                      imagePath: 'assets/images/layanan/suplier.jpg',
                                      label: 'Produk Suplier',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ProdusenScreen()),
                                    ),
                                    child: const LayananBox(
                                      imagePath: 'assets/images/layanan/produsen.jpg',
                                      label: 'Produk Produsen',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const DistributorScreen()),
                                    ),
                                    child: const LayananBox(
                                      imagePath: 'assets/images/layanan/distributor.jpg',
                                      label: 'Produk Distributor',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const RetailerScreen()),
                                    ),
                                    child: const LayananBox(
                                      imagePath: 'assets/images/layanan/retailer.jpg',
                                      label: 'Produk Retailer',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const InformasiScreen()),
                                    ),
                                    child: const LayananBox(
                                      imagePath: 'assets/images/layanan/informasi.png',
                                      label: 'Informasi pertanian',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //const SizedBox(height: 20),

                      // Section Produk Pertanian
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Produk Pertanian',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // List of Products
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Column(
                      //     children: produsens.map((produsen) {
                      //       return InkWell(
                      //         borderRadius: BorderRadius.circular(20),
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => DetailProdusenScreen(
                      //                 produsen: produsen,
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         child: ProdusenCard(
                      //           name: produsen.title,
                      //           description: produsen.description,
                      //           readyStock: produsen.readyStock,
                      //           category: produsen.category,
                      //           price: produsen.harga,
                      //           imageUrl: produsen.imageUrl[0],
                      //           onAddPressed: () {
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(content: Text("${produsen.title} masuk ke keranjang")),
                      //             );
                      //           },
                      //         ),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<String?> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }
}
