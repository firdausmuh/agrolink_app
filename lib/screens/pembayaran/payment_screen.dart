import 'package:agrolink/components/payment/payment_card.dart';
import 'package:agrolink/screens/riwayat_transaksi/riwayat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../toko/toko_screen.dart';

class PaymentScreen extends StatefulWidget {
  final int totalHarga;

  const PaymentScreen({required this.totalHarga, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _uploadedImagePath;

  void _showSuccessMessage() async {
    // Tampilkan dialog sukses
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Approved'),
          content: const Text('Pembayaran kamu telah diterima oleh seller. Silahkan menunggu hingga produk pesanan anda sampai.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // Tunggu beberapa detik, lalu pindah ke layar riwayat
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.of(context).pop(); // Tutup dialog
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TokoScreen()),
      );
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _uploadedImagePath = image.path; // Simpan path gambar yang diupload
      });
      _showSuccessMessage(); // Tampilkan pesan sukses setelah upload
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Product',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Panggil fungsi untuk menampilkan pesan sukses
                  _showSuccessMessage();
                },
                child: PaymentCard(totalHarga: widget.totalHarga),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _uploadImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20), // Adjust padding as needed
                  child: const Center(
                    child: Text(
                      'Upload Bukti Pembayaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Adjust font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              if (_uploadedImagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text('Uploaded Image: $_uploadedImagePath'),
                ),
            ],
          );
        },
      ),
    );
  }
}
