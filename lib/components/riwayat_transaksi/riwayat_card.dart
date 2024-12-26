import 'package:flutter/material.dart';

class RiwayatCard extends StatefulWidget {
  const RiwayatCard({super.key});

  @override
  State<RiwayatCard> createState() => _RiwayatCardState();
}

class _RiwayatCardState extends State<RiwayatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar produk
          Container(
            width: 88,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/retailer/beras.png', // Path ke gambar produk
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Informasi produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama produk dan tombol selesai
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Beras Premium',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      child: Center(
                        child: Text(
                            'Selesai',
                            style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )

                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                // Keterangan jumlah barang
                const Text(
                  '1 pack barang',
                  style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                // Total belanja
                const Text(
                  'Total Belanja: Rp 65.000',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                //const SizedBox(height: 6),
                // Ulasan produk dan tombol beli lagi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Ulasan Produk: Good',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Logic untuk membeli lagi
                      },
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.green),
                      label: const Text(
                        'Beli Lagi',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
