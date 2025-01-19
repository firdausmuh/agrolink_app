import 'package:flutter/material.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  bool _showRingkasan = false; // Variabel untuk mengontrol visibilitas ringkasan

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Detail Pesanan
                  Container(
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
                                  'assets/images/produsen/buah_naga1.png', // Ganti dengan path gambar produk
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Muhamad Firdaus", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text("1 Pesanan", style: TextStyle(fontSize: 16)),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 20,
                                        width: 1,
                                        color: Colors.grey.shade300,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text("Rp. 15.000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text("Jenis Produk: Produk Produsen", style: TextStyle(color: Colors.grey)),
                                  const Text("Alamat: Jln. Patangpuluhan Yogyakarta", style: TextStyle(color: Colors.grey)),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showRingkasan = !_showRingkasan; // Toggle visibilitas ringkasan
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Cek Ringkasan",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: 80, // Ukuran tombol "Tolak"
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic untuk menolak pesanan
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
                                      // Logic untuk mengonfirmasi pesanan
                                    },
                                    style: ElevatedButton.styleFrom(
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
                  ),
                  const SizedBox(height: 20),
                  // Ringkasan Pesanan
                  if (_showRingkasan) ...[
                    const Text("Ringkasan Pesanan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
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
                        children: [
                          _buildSummaryRow('Pelanggan', 'Muhamad Firdaus'),
                          _buildSummaryRow('Jenis Produk', 'Produk Produsen'),
                          _buildSummaryRow('Total Produk', '150 Gram'),
                          _buildSummaryRow('Catatan Penjual', 'Segera Dikirim Yah Kak'),
                          const Divider(color: Colors.grey, thickness: 1),
                          _buildSummaryRow(
                            'Total Tagihan',
                            'Rp. 30.000',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Tab Berlangsung
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/animasi_kosong.png',
                    height: 250,
                    width: 250,
                  ),
                  const Text(
                    'Belum ada produk yang berlangsung',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
            // Tab Selesai
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/animasi_kosong.png',
                    height: 250,
                    width: 250,
                  ),
                  const Text(
                    'Belum ada produk yang selesai',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
