import 'package:agrolink/components/perawatan_tanaman/perawatan_card.dart';
import 'package:agrolink/models/PerawatanTanaman.dart';
import 'package:agrolink/screens/perawatan_tanaman/detail_perawatan_tanaman_screen.dart';
import 'package:flutter/material.dart';

import '../../components/search_bar.dart';

class PerawatanTanamanScreen extends StatefulWidget {
  const PerawatanTanamanScreen({super.key});

  @override
  State<PerawatanTanamanScreen> createState() => _PerawatanTanamanScreenState();
}

class _PerawatanTanamanScreenState extends State<PerawatanTanamanScreen> {
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
          'Perawatan Tanaman',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBarWithController(
              hintText: 'Mau Rawat Tanaman Apa',
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
                      children: perawatanTanamans.map((perawatanTanaman) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPerawatanTanamanScreen(
                                                perawatanTanaman:
                                                    perawatanTanaman)))
                              },
                              child: PerawatanCard(
                                name: perawatanTanaman.title,
                                description: perawatanTanaman.description,
                                imageUrl: perawatanTanaman.imageUrl,
                                onAddPressed: () {
                                  // Handle add to cart action
                                  SnackBar(
                                    content: Text(
                                        "${perawatanTanaman.title} masuk ke keranjang"),
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
