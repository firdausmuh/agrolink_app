import 'package:agrolink/components/payment/payment_card.dart';
import 'package:agrolink/screens/riwayat_transaksi/riwayat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void _showSuccessMessage() async {
    // Tampilkan dialog sukses
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Pembayaran pesanan Anda telah berhasil dan di approve oleh penjual!'),
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
        MaterialPageRoute(builder: (context) => const RiwayatScreen()),
      );
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
          return GestureDetector(
            onTap: () {
              // Panggil fungsi untuk menampilkan pesan sukses
              _showSuccessMessage();
            },
            child: const PaymentCard(),
          );
        },
      ),
    );
  }
}