import 'package:flutter/material.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  List<Map<String, dynamic>> _pesananBaru = []; // List untuk menyimpan pesanan baru
  List<Map<String, dynamic>> _pesananBerlangsung = []; // List untuk menyimpan pesanan yang sedang berlangsung

  @override
  void initState() {
    super.initState();
    // Inisialisasi pesanan baru
    _pesananBaru = [
      {
        'nama': 'Muhamad Firdaus',
        'jumlah': 1,
        'harga': 40000,
        'jenisProduk': 'Produk Produsen',
        'alamat': 'Jln. Patangpuluhan Yogyakarta',
        'gambar': 'assets/images/distributor/sabun_herba.png',
      },
    ];
  }

  void _konfirmasiPesanan(int index) {
    var pesanan = _pesananBaru[index];

    // Tampilkan pesan konfirmasi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Anda telah menerima pesanan dari ${pesanan['nama']}"),
        duration: const Duration(seconds: 3),
      ),
    );

    // Pindahkan pesanan ke pesanan berlangsung
    setState(() {
      _pesananBerlangsung.add(pesanan);
      _pesananBaru.removeAt(index);
    });
  }

  void _tolakPesanan(int index) {
    var pesanan = _pesananBaru[index];

    // Tampilkan pesan penolakan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Anda telah menolak pesanan dari ${pesanan['nama']}"),
        duration: const Duration(seconds: 3),
      ),
    );

    // Hapus pesanan dari daftar pesanan baru
    setState(() {
      _pesananBaru.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Pesanan",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFF406A52),
            tabs: [
              Tab(text: "Baru"),
              Tab(text: "Berlangsung"),
              Tab(text: "Selesai"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Baru
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _pesananBaru.isNotEmpty
                  ? ListView.builder(
                itemCount: _pesananBaru.length,
                itemBuilder: (context, index) {
                  var pesanan = _pesananBaru[index];
                  return _buildPesananCard(pesanan, index);
                },
              )
                  : _buildEmptyState('Belum ada pesanan baru'),
            ),
            // Tab Berlangsung
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _pesananBerlangsung.isNotEmpty
                  ? ListView.builder(
                itemCount: _pesananBerlangsung.length,
                itemBuilder: (context, index) {
                  var pesanan = _pesananBerlangsung[index];
                  return _buildPesananCard(pesanan, index, isBerlangsung: true);
                },
              )
                  : _buildEmptyState('Belum ada produk yang berlangsung'),
            ),
            // Tab Selesai
            _buildEmptyState('Belum ada produk yang selesai'),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/animasi_kosong.png',
            height: 250,
            width: 250,
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildPesananCard(Map<String, dynamic> pesanan, int index, {bool isBerlangsung = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    pesanan['gambar'], // Ganti dengan path gambar produk
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pesanan['nama'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${pesanan['jumlah']} Pesanan", style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(width: 8),
                        Text("Rp. ${pesanan['harga']}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text("Jenis Produk: ${pesanan['jenisProduk']}", style: const TextStyle(color: Colors.grey)),
                    Text("Alamat: ${pesanan['alamat']}", style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Baris untuk tombol
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Cek Ringkasan",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 80, // Ukuran tombol "Tolak"
                    child: ElevatedButton(
                      onPressed: () {
                        _tolakPesanan(index); // Tolak pesanan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2), // Padding diperkecil
                      ),
                      child: const Text("Tolak", style: TextStyle(fontSize: 12, color: Colors.black)), // Warna teks hitam
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80, // Ukuran tombol "Konfirmasi"
                    child: ElevatedButton(
                      onPressed: () {
                        _konfirmasiPesanan(index); // Konfirmasi pesanan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2), // Padding diperkecil
                      ),
                      child: const Text("Konfirmasi", style: TextStyle(fontSize: 12, color: Colors.black)), // Warna teks hitam
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
