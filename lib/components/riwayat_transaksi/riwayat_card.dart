import 'package:agrolink/screens/keranjang/keranjang_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:url_launcher/url_launcher.dart'; // Import for URL Launcher
import '../../models/transaction_model.dart';

class RiwayatCard extends StatelessWidget {
  final Transaction transaction;

  const RiwayatCard({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  transaction.productImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.productName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              transaction.status,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.green[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Jumlah: ${transaction.quantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Produk: ${transaction.productType}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Total: Rp ${transaction.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Additional UI elements based on status
                      if (transaction.status == 'Dikirim') ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Show dialog with shipping information
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Informasi Pengiriman'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('Kurir'),
                                              Text('J&T Express'),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('No Resi'),
                                              Row(
                                                children: [
                                                  Text('GK8374827'),
                                                  const SizedBox(width: 8),
                                                  IconButton(
                                                    icon: const Icon(Icons.copy),
                                                    onPressed: () {
                                                      Clipboard.setData(const ClipboardData(text: 'GK8374827'));
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(content: Text('No resi telah disalin')),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('Alamat'),
                                              Text('Muhamad Firdaus'),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('No Telepon'),
                                              Text('Kos Belakang Canting Mas'),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () async{
                                              const url = 'https://anteraja.id/id/tracking';
                                              if (await canLaunch(url)) {
                                                await launch(url);
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Tidak dapat membuka URL')),
                                                );
                                              }
                                            },
                                            child: Text(
                                              'Lacak pengiriman di sini',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Tutup'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Cek info pengiriman >',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54, // Change color to indicate it's clickable
                                  //decoration: TextDecoration.underline, // Add underline for better UX
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // Action for tracking
                                const url = 'https://anteraja.id/id/tracking';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Tidak dapat membuka URL')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green, // Green background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Adjusted padding
                                minimumSize: const Size(40, 10), // Adjusted size
                              ),
                              child: const Text(
                                'Lacak',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ] else if (transaction.status == 'Selesai') ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Show dialog for review
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    final TextEditingController _reviewController = TextEditingController();

                                    return AlertDialog(
                                      title: const Text('Apa yang bikin kamu puas?'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            controller: _reviewController,
                                            decoration: const InputDecoration(
                                              hintText: 'Contoh: Lega karena packingannya aman & rapi.',
                                              border: OutlineInputBorder(),
                                            ),
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Kirim'),
                                          onPressed: () {
                                            // Handle review submission
                                            final reviewText = _reviewController.text;
                                            if (reviewText.isNotEmpty) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Ulasan Anda: $reviewText')),
                                              );
                                              Navigator.of(context).pop();
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Ulasan tidak boleh kosong')),
                                              );
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Tutup'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green, // Green background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Adjusted padding
                                minimumSize: const Size(40, 10), // Adjusted size
                              ),
                              child: const Text(
                                'Ulas',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Action for buy again
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => KeranjangScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green, // Green background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Adjusted padding
                                minimumSize: const Size(40, 10), // Adjusted size
                              ),
                              child: const Text(
                                'Beli lagi',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
