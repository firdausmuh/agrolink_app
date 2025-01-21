import 'package:flutter/material.dart';
import '../../components/riwayat_transaksi/riwayat_card.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 20,
        title: const Text(
          "Riwayat Pembelian",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false, // Mengatur teks di tengah
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 1, // Ganti dengan jumlah data riwayat sebenarnya
        itemBuilder: (context, index) {
          return const RiwayatCard();
        },
      ),
    );
  }
}
