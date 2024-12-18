import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String shopImage;
  final String namaToko;
  final bool isOnline;
  final String alamat;
  final double rating;
  final String statusPesanan;
  final VoidCallback onAddPressed;

  const ShopCard({
    Key? key,
    required this.shopImage,
    required this.namaToko,
    required this.isOnline,
    required this.alamat,
    required this.rating,
    required this.statusPesanan,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Gambar Toko
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                shopImage,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Info Toko
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Toko
                  Text(
                    namaToko,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Status Online
                  Text(
                    isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: isOnline ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Alamat
                  Text(
                    alamat,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Rating Bintang
                  Row(
                    children: List.generate(
                      5,
                          (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Status Pesanan
                  Text(
                    'Pesanan aktif: $statusPesanan',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Button Follow Toko
            IconButton(
              onPressed: () {
                // Handle follow toko action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Toko diikuti')),
                );
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}