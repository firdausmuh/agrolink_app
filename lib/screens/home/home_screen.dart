import 'package:agrolink/components/layanan_box.dart';
import 'package:agrolink/screens/informasi/informasi_screen.dart';
import 'package:agrolink/screens/produk_distributor/distributor_screen.dart';
import 'package:agrolink/screens/produk_produsen/produsen_screen.dart';
import 'package:agrolink/screens/produk_retailer/retailer_screen.dart';
import 'package:agrolink/screens/produk_supplier/supplier_screen.dart';
import 'package:flutter/material.dart';
import '../../components/produk_produsen/produsen_card.dart';
import '../../models/Produsen.dart';
import '../produk_produsen/detail_produsen_screen.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Hello Muhamad Firdaus',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
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
              const SizedBox(
                width: 12,
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                const AssetImage('assets/images/profile1.png'),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // Section iklan
        Row(
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/iklan.png',
              fit: BoxFit.cover),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
        ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Even space between items
                          children: [
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SupplierScreen()),
                                  )
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/suplier.jpg',
                                    label: 'Produk Suplier'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProdusenScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/produsen.jpg',
                                    label: 'Produk Produsen'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DistributorScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/distributor.jpg',
                                    label: 'Produk Distributor'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const RetailerScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                    'assets/images/layanan/retailer.jpg',
                                    label: 'Produk Retailer'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const InformasiScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                    'assets/images/layanan/informasi.png',
                                    label: 'Informasi pertanian'),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),

                const SizedBox(
                  height: 20,
                ),
                // Section terbaru
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Produk Pertanian',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      children: produsens.map((produsen) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailProdusenScreen(
                                        produsen: produsen)))
                          },
                          child: Column(
                            children: [
                              ProdusenCard(
                                name: produsen.title,
                                description: produsen.description,
                                readyStock: produsen.readyStock,
                                category: produsen.category,
                                price: produsen.harga,
                                imageUrl: produsen.imageUrl[0],
                                onAddPressed: () {
                                // Handle add to cart action
                                  SnackBar(
                                    content: Text("${produsen.title} masuk ke keranjang"),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
