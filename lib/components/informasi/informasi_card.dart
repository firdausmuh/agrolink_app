import 'package:flutter/material.dart';

import '../../models/InformasiData.dart';
import '../../screens/informasi/detail_informasi_screen.dart';

class InformasiCard extends StatelessWidget {
  final InformasiData informasiData;
  final Color warnaTombol;

  const InformasiCard(
      {super.key,
      this.warnaTombol = const Color(0xFF2ECC71),
      required this.informasiData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              informasiData.imageUrl[0], // Replace with your image URL
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Text Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  informasiData.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  informasiData.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Button Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailInformasiScreen(
                            informasiData: informasiData)))
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: warnaTombol, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                children: [
                  Text(
                    'Selanjutnya',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10), // Space at the bottom
        ],
      ),
    );
  }
}
