import 'dart:convert';
import 'dart:io';
import 'package:agrolink/screens/toko/analysis_screen.dart';
import 'package:agrolink/screens/toko/upload_produk_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'PesananScreen.dart';

class TokoScreen extends StatefulWidget {
  const TokoScreen({Key? key}) : super(key: key);

  @override
  _TokoScreenState createState() => _TokoScreenState();
}

class _TokoScreenState extends State<TokoScreen> {
  List<Map<String, dynamic>> produkList = [];
  int jumlahPesanan = 0; // Menyimpan jumlah pesanan

  @override
  void initState() {
    super.initState();
    _loadProducts(); // Memuat produk saat layar diinisialisasi
    _loadPesanan(); // Memuat jumlah pesanan
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSnackbar(); // Show Snackbar after the first frame
    });
  }

  Future<void> _loadProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? produkString = prefs.getString('produkList');
    if (produkString != null) {
      List<dynamic> produkJson = json.decode(produkString);
      produkList = List<Map<String, dynamic>>.from(produkJson);
      setState(() {});
    }
  }

  Future<void> _loadPesanan() async {
    // Logika untuk memuat jumlah pesanan dari sumber data Anda
    // Misalnya, Anda bisa menggunakan SharedPreferences atau API
    // Untuk contoh ini, kita akan menggunakan nilai statis
    setState(() {
      jumlahPesanan = 1; // Ganti dengan logika yang sesuai
    });
  }

  void _showSnackbar() {
    final snackBar = SnackBar(
      content: const Text("Anda memiliki satu pesanan produk, cek untuk melihat ringkasan pesanannya"),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green, // Set the background color to green
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _saveProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String produkString = json.encode(produkList);
    await prefs.setString('produkList', produkString);
  }

  void _deleteProduct(int index) {
    setState(() {
      produkList.removeAt(index);
      _saveProducts(); // Simpan setelah menghapus produk
    });

    // Tampilkan SnackBar setelah produk dihapus
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Produk berhasil dihapus"),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green, // Warna latar belakang SnackBar
      ),
    );
  }

  void _editProduct(int index) {
    // Navigasi ke halaman edit produk
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadProdukScreen(
          produkList: produkList,
          index: index, // Kirim indeks produk yang akan diedit
          isEdit: true, // Menambahkan parameter untuk menandakan ini adalah edit
        ),
      ),
    ).then((updatedList) {
      if (updatedList != null) {
        setState(() {
          produkList = updatedList; // Memperbarui daftar produk dengan yang baru
          _saveProducts(); // Simpan setelah memperbarui produk
        });

        // Tampilkan SnackBar setelah produk berhasil diperbarui
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Data produk berhasil diperbarui"),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green, // Warna latar belakang SnackBar
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Toko Saya",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile/profile2.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF406A52),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                      onPressed: () {
                        // Aksi edit
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Firdaus Garden Store',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 5),
                Text(
                  'Online Yogyakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      produkList.length.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Produk di Toko',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman pesanan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PesananScreen(cartItems: [],)),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            jumlahPesanan.toString(), // Menampilkan jumlah pesanan
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          if (jumlahPesanan > 0) // Menampilkan titik hijau jika ada pesanan
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 8,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Pesanan Produk',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman grafik penjualan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnalysisScreen()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/toko/analysis.png', // Ganti dengan path gambar analitik Anda
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Laporan Penjualan',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Daftar produk
            Expanded(
              child: produkList.isNotEmpty
                  ? ListView.builder(
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  final produk = produkList[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // Gambar produk
                        Container(
                          width: 120,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                          child: produk['image'] != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(produk['image']), // Menggunakan path gambar
                              fit: BoxFit.cover,
                            ),
                          )
                              : const Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Detail produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    produk['nama'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20, // Mengatur ukuran ikon hapus di sini
                                    ),
                                    onPressed: () => _deleteProduct(index),
                                  ),
                                ],
                              ),
                              Text(
                                produk['deskripsi'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text(
                                    'Kategori: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    produk['kategori'] ?? 'Tidak ada',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text(
                                    'Stok Tersedia: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    produk['stoktersedia'] ?? 'Tidak ada',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Text(
                                    'Ketahanan: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    produk['ketahanan'] ?? 'Tidak ada',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _formatCurrency(produk['harga']),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(width: 20), // Menambahkan jarak di sini
                                  GestureDetector(
                                    onTap: () => _editProduct(index),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                      child: const Center(
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/animasi_kosong.png',
                      height: 250,
                      width: 250,
                    ),
                    const Text(
                      'Belum ada produk di toko',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF406A52),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadProdukScreen(produkList: produkList),
            ),
          ).then((updatedList) {
            if (updatedList != null) {
              setState(() {
                produkList = updatedList; // Memperbarui daftar produk dengan yang baru
                _saveProducts(); // Simpan setelah memperbarui produk
              });
            }
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  String _formatCurrency(String value) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    try {
      return formatter.format(int.parse(value));
    } catch (_) {
      return 'Rp 0';
    }
  }
}
