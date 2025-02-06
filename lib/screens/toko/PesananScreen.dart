import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  List<Map<String, dynamic>> _pesananBaru = []; // List untuk menyimpan pesanan baru
  List<Map<String, dynamic>> _pesananBerlangsung = []; // List untuk menyimpan pesanan yang sedang berlangsung
  List<Map<String, dynamic>> _pesananSelesai = []; // List untuk menyimpan pesanan yang selesai
  Map<int, bool> _isExpanded = {}; // State untuk melacak apakah ringkasan sedang ditampilkan

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
        'pengiriman': 'J&T Express',
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

  void _kirimPesanan(int index) {
    var pesanan = _pesananBerlangsung[index];

    // Tampilkan pesan konfirmasi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pesanan dari ${pesanan['nama']} telah dikirim."),
        duration: const Duration(seconds: 3),
      ),
    );

    // Pindahkan pesanan ke pesanan selesai
    setState(() {
      _pesananSelesai.add(pesanan);
      _pesananBerlangsung.removeAt(index);
    });
  }

  void _toggleRingkasan(int index) {
    setState(() {
      _isExpanded[index] = !_isExpanded[index]!;
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
              Tab(text: "Konfirmasi"),
              Tab(text: "Dikirim"),
              Tab(text: "Selesai"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Menunggu Konfirmasi
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
            // Tab Dikirim
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
                  : _buildEmptyState('Belum ada pesanan yang dikirim'),
            ),
            // Tab Selesai
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _pesananSelesai.isNotEmpty
                  ? ListView.builder(
                itemCount: _pesananSelesai.length,
                itemBuilder: (context, index) {
                  var pesanan = _pesananSelesai[index];
                  return _buildPesananCard(pesanan, index, isSelesai: true);
                },
              )
                  : _buildEmptyState('Belum ada pesanan yang selesai'),
            ),
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

  Widget _buildPesananCard(Map<String, dynamic> pesanan, int index, {bool isBerlangsung = false, bool isSelesai = false}) {
    // Inisialisasi state _isExpanded jika belum ada
    if (_isExpanded[index] == null) {
      _isExpanded[index] = false;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
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
                        Text("Jumlah: ${pesanan['jumlah']} ", style: const TextStyle(fontSize: 16)),
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
                    Text("Pengiriman: ${pesanan['pengiriman']}", style: const TextStyle(color: Colors.grey)),
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
                  GestureDetector(
                    onTap: () {
                      _toggleRingkasan(index);
                    },
                    child: Row(
                      children: [
                        Text(
                          isBerlangsung ? "Cek Pengiriman" : "Lihat Invoice",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          _isExpanded[index]! ? Icons.arrow_drop_down : Icons.arrow_right,
                          size: 25,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!isBerlangsung && !isSelesai)
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
                        child: const Text("Tolak", style: TextStyle(fontSize: 12, color: Colors.white)), // Warna teks putih
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
                        child: const Text("Konfirmasi", style: TextStyle(fontSize: 12, color: Colors.white)), // Warna teks putih
                      ),
                    ),
                  ],
                ),
              if (isBerlangsung) // Tombol Kirim hanya muncul di tab Dikirim
                Row(
                  children: [
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 80, // Ukuran tombol "Kirim"
                      child: ElevatedButton(
                        onPressed: () {
                          _kirimPesanan(index); // Kirim pesanan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 2), // Padding diperkecil
                        ),
                        child: const Text("Kirim", style: TextStyle(fontSize: 12, color: Colors.white)), // Warna teks putih
                      ),
                    ),
                  ],
                ),
            ],
          ),
          // Ringkasan Pemesanan atau Pengiriman
          if (_isExpanded[index]!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                if (isBerlangsung)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cek Pengiriman",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text("Nama Pemesan: Muhamad Firdaus"),
                      const SizedBox(height: 5),
                      Text("Jenis Pengiriman: J&T Express"),
                      const SizedBox(height: 5),
                      Text("Alamat: Jalan Patangpuluhan"),
                    ],
                  )
                else if (isSelesai)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Firdaus Store",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nama Pelanggan: ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Nadila Azucena",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nomor Invoice: ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "2025/xx/234",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nomor kontak/alamat:  ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Jl. patangpuluhan",
                            style: const TextStyle(fontSize: 14), maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tanggal Pembelian  ",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "23 Januari 2025",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Nama barang",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Jumlah",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Harga satuan",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sub total",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Sabun Herba"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("2pcs"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Rp15.000"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Rp30.000"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Ongkos kirim"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("20 gram"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("-"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Rp4.000"),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Biaya proteksi"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("-"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Rp4.000"),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Rp4.000"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              // Menampilkan SnackBar setelah tombol ditekan
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Invoice berhasil didownload')),
                              );
                            },
                            label: Text("Cetak Invoice", style: TextStyle(fontSize: 14)),
                            icon: const Icon(Icons.picture_as_pdf, size: 18, color: Colors.red),
                          ),
                          Text(
                            "Total: Rp38.000",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "Ringkasan Pemesanan",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text("Nama Pelanggan: ${pesanan['nama']}"),
                      const SizedBox(height: 5),
                      Text("Jenis Produk: ${pesanan['jenisProduk']}"),
                      const SizedBox(height: 5),
                      Text("Jumlah Beli: ${pesanan['jumlah']}"),
                      const SizedBox(height: 5),
                      Text("Total Harga: Rp. ${pesanan['harga']}"),
                      const SizedBox(height: 5),
                      Text("Pengiriman: ${pesanan['pengiriman']}"),
                    ],
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

