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
        title: const Text('Riwayat Pembelian'),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black)
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2, // Ganti dengan jumlah data riwayat sebenarnya
        itemBuilder: (context, index) {
          return const RiwayatCard();
        },
      ),
    );
  }
}
