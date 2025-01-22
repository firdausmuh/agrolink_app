import 'package:flutter/material.dart';
import '../../components/riwayat_transaksi/riwayat_card.dart';
import '../../models/transaction_model.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  String? selectedStatus; // Untuk menyimpan status yang dipilih
  List<Transaction> transactions = [
    Transaction(
      id: '1',
      status: 'Menunggu Konfirmasi',
      productName: 'Madu Asli',
      productImage: 'assets/images/distributor/madu_asli.png',
      customerName: 'Muhamad Firdaus',
      quantity: 2,
      productType: 'Distributor',
      totalPrice: 150000.0,
    ),
    Transaction(
      id: '2',
      status: 'Dikirim',
      productName: 'Sabun Herba',
      productImage: 'assets/images/distributor/sabun_herba.png',
      customerName: 'Muhamad Firdaus',
      quantity: 1,
      productType: 'Distributor',
      totalPrice: 75000.0,
    ),
    Transaction(
      id: '3',
      status: 'Dikirim',
      productName: 'Kopi Kemasan',
      productImage: 'assets/images/distributor/kopi_kemasan.png',
      customerName: 'Muhamad Firdaus',
      quantity: 3,
      productType: 'Distributor',
      totalPrice: 225000.0,
    ),
    Transaction(
      id: '4',
      status: 'Selesai',
      productName: 'Beras Premium',
      productImage: 'assets/images/produsen/beras_premium.png',
      customerName: 'Muhamad Firdaus',
      quantity: 1,
      productType: 'Produsen',
      totalPrice: 120000.0,
    ),
    Transaction(
      id: '5',
      status: 'Tidak Berhasil',
      productName: 'Sayur Sawi',
      productImage: 'assets/images/produsen/sayur_sawi1.png',
      customerName: 'Muhamad Firdaus',
      quantity: 1,
      productType: 'Retailer',
      totalPrice: 90000.0,
    ),
  ];

  void _showStatusFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Mau lihat status apa?'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Semua Status Transaksi
                _buildRadioOption('Semua Status Transaksi'),
                const SizedBox(height: 12),
                // Menunggu Konfirmasi
                _buildRadioOption('Menunggu Konfirmasi'),
                const SizedBox(height: 12),
                // Diproses
                _buildRadioOption('Diproses'),
                const SizedBox(height: 12),
                // Dikirim
                _buildRadioOption('Dikirim'),
                const SizedBox(height: 12),
                // Berhasil
                _buildRadioOption('Selesai'),
                const SizedBox(height: 12),
                // Tidak Berhasil
                _buildRadioOption('Tidak Berhasil'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    ).then((_) {
      // Terapkan filter setelah dialog ditutup
      if (selectedStatus != null) {
        setState(() {
          // Lakukan sesuatu dengan selectedStatus
          print('Status yang dipilih: $selectedStatus');
        });
      }
    });
  }

  Widget _buildRadioOption(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 30), // Jarak antara teks dan radio button
        Radio<String>(
          value: title,
          groupValue: selectedStatus,
          onChanged: (value) {
            setState(() {
              selectedStatus = value;
              Navigator.pop(context); // Tutup dialog setelah memilih
            });
          },
          activeColor: Colors.green, // Warna ketika dipilih
        ),
      ],
    );
  }

  List<Transaction> _getFilteredTransactions() {
    if (selectedStatus == null || selectedStatus == 'Semua Status Transaksi') {
      return transactions;
    }
    return transactions.where((transaction) => transaction.status == selectedStatus).toList();
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cari status pesanan kamu disini!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1),
                GestureDetector(
                  onTap: () {
                    _showStatusFilterDialog(context); // Tampilkan dialog saat diklik
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedStatus ?? 'Semua Status',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _getFilteredTransactions().length,
              itemBuilder: (context, index) {
                final transaction = _getFilteredTransactions()[index];
                return RiwayatCard(transaction: transaction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
