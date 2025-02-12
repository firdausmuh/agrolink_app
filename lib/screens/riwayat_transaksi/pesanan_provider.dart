import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';

class PesananProvider with ChangeNotifier {
  List<Map<String, dynamic>> _pesananBaru = [];
  List<Map<String, dynamic>> _pesananBerlangsung = [];
  List<Map<String, dynamic>> _pesananSelesai = [];
  List<Transaction> _riwayatTransaksi = [];

  List<Map<String, dynamic>> get pesananBaru => _pesananBaru;
  List<Map<String, dynamic>> get pesananBerlangsung => _pesananBerlangsung;
  List<Map<String, dynamic>> get pesananSelesai => _pesananSelesai;
  List<Transaction> get riwayatTransaksi => _riwayatTransaksi;

  void addPesananBaru(Map<String, dynamic> pesanan) {
    _pesananBaru.add(pesanan);
    notifyListeners();
  }

  void konfirmasiPesanan(int index) {
    var pesanan = _pesananBaru[index];
    pesanan['status'] = 'Dikirim';
    _pesananBerlangsung.add(pesanan);
    _pesananBaru.removeAt(index);
    notifyListeners();
  }

  void tolakPesanan(int index) {
    var pesanan = _pesananBaru[index];
    pesanan['status'] = 'Tidak Berhasil';
    _pesananBaru.removeAt(index);
    notifyListeners();
  }

  void kirimPesanan(int index) {
    var pesanan = _pesananBerlangsung[index];
    pesanan['status'] = 'Selesai';
    _pesananSelesai.add(pesanan);
    _pesananBerlangsung.removeAt(index);

    // Tambahkan ke riwayat transaksi
    _riwayatTransaksi.add(Transaction(
      id: DateTime.now().toString(),
      status: 'Selesai',
      productName: pesanan['nama'],
      productImage: pesanan['gambar'],
      customerName: 'Muhamad Firdaus', // Ganti dengan nama pelanggan yang sesuai
      quantity: pesanan['jumlah'],
      productType: pesanan['jenisProduk'],
      totalPrice: pesanan['harga'],
    ));
    notifyListeners();
  }
}