import 'package:flutter/material.dart';
import '../../components/riwayat_transaksi/riwayat_card.dart';
import '../../models/transaction_model.dart';

class RiwayatScreen extends StatefulWidget {
  final List<Map<String, dynamic>> pesananBaru;
  final List<Map<String, dynamic>> pesananBerlangsung;
  final List<Map<String, dynamic>> pesananSelesai;
  final List<Map<String, dynamic>> pesananDitolak;

  const RiwayatScreen({
    super.key,
    required this.pesananBaru,
    required this.pesananBerlangsung,
    required this.pesananSelesai,
    required this.pesananDitolak
  });

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  String? selectedStatus; // Untuk menyimpan status yang dipilih
  List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();

    // Gabungkan semua daftar pesanan
    List<Map<String, dynamic>> semuaPesanan = [];
    semuaPesanan.addAll(widget.pesananBaru);
    semuaPesanan.addAll(widget.pesananBerlangsung);
    semuaPesanan.addAll(widget.pesananSelesai);

    // Konversi ke daftar Transaction
    transactions = semuaPesanan.map((pesanan) {
      return Transaction(
        id: '${transactions.length + 1}',
        status: pesanan['status'] ?? 'Menunggu Konfirmasi',
        productName: pesanan['nama'],
        productImage: pesanan['gambar'],
        customerName: 'Muhamad Firdaus', // Anda bisa menyesuaikan ini
        quantity: pesanan['jumlah'],
        productType: pesanan['jenisProduk'],
        totalPrice: pesanan['harga'],
      );
    }).toList();
  }

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
                // Dikirim
                _buildRadioOption('Dikirim'),
                const SizedBox(height: 12),
                // Berhasil
                _buildRadioOption('Selesai'),
                const SizedBox(height: 12),
                // Tidak Berhasil
                _buildRadioOption('Ditolak'),
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