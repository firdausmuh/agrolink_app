import 'package:agrolink/components/produk_produsen/produsen_card.dart';
import 'package:agrolink/screens/produk_produsen/detail_produsen_screen.dart';
import 'package:flutter/material.dart';
import '../../components/produk_supplier/supplier_card.dart';
import '../../models/Produsen.dart';
import '../../models/Supplier.dart';
import '../keranjang/checkout_screen.dart';
import '../produk_supplier/detail_supplier_screen.dart';
import '../profile/profile_screen.dart';

class SupplierHome extends StatelessWidget {
  const SupplierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selamat datang di Agrolink',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
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
                      hintText: 'Cari Produk Supplier...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey, // Warna garis
                          width: 1.5, // Ketebalan garis
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey, // Warna garis saat tidak fokus
                          width: 1.5, // Ketebalan garis
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Warna garis saat fokus
                          width: 2.0, // Ketebalan garis saat fokus
                        ),
                      ),
                    ),
                    onSubmitted: (query) {
                      print('Searching for: $query');
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow, // Warna latar belakang
                      border: Border.all(
                        color: Colors.yellow, // Warna garis persegi
                        width: 6, // Ketebalan garis
                      ),
                      borderRadius: BorderRadius.circular(8), // Membuat sudut persegi lebih lembut
                    ),
                    padding: const EdgeInsets.all(8), // Spasi di sekitar ikon
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.deepOrange, // Warna ikon
                      size: 24, // Ukuran ikon
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                                    produsen: produsen
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
                                        MaterialPageRoute(builder: (context) => CheckoutScreen()),
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
                          }).toList()
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



