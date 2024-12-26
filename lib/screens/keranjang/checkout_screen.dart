import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Menyimpan data pengiriman dan total harga
  String alamat = '';
  String metodePembayaran = 'COD';
  int totalHarga = 0;

  // List harga item dan jumlah item di keranjang
  List<int> hargaItem = [25000, 30000, 15000]; // contoh harga
  List<int> jumlahItem = [1, 1, 1]; // contoh jumlah

  // Fungsi untuk menghitung total harga
  void updateTotalHarga() {
    setState(() {
      totalHarga = 0;
      for (int i = 0; i < hargaItem.length; i++) {
        totalHarga += hargaItem[i] * jumlahItem[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    updateTotalHarga(); // Memperbarui total harga saat tampilan di-render ulang

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color(0xFF406A52),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Alamat Pengiriman kamu',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Terbansari gank v No.106, RT.04/RW.01, Terban, Kec. '
                        'Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    maxLines: 3, // Membatasi jumlah baris
                    overflow: TextOverflow.ellipsis, // Menambahkan ... jika teks terlalu panjang
                  ),
                ),
                const SizedBox(width: 8), // Memberikan jarak antara teks dan ikon
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8), // Jarak antara Row dan Divider
            const Divider(
              color: Colors.grey, // Warna garis
              thickness: 1, // Ketebalan garis
            ),
            // Produk yang di beli

            const SizedBox(height: 10),

            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: metodePembayaran,
              items: const [
                DropdownMenuItem(value: 'COD', child: Text('COD (Bayar di Tempat)')),
                DropdownMenuItem(value: 'Transfer', child: Text('Transfer Bank')),
              ],
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Cek ringkasan transaksimu, yuk',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(hargaItem.length, (index) {
                    return ListTile(
                      title: Text('Produk ${index + 1}'),
                      subtitle: Text('Jumlah: ${jumlahItem[index]}'),
                      trailing: Text('Rp. ${hargaItem[index] * jumlahItem[index]}'),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pembayaran',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  'Rp. ${totalHarga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            // button bayar sekarang
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Logic untuk menyelesaikan transaksi
                  // Bisa tambahkan konfirmasi atau API untuk pengolahan pembayaran
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pesanan Anda telah diproses!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF199D52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Menyesuaikan ukuran tombol dengan konten
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5), // Memberikan jarak antara ikon dan lingkaran
                      decoration: BoxDecoration(
                        //color: Colors.white, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Icon(
                        Icons.check_circle_outline, // Ikon ceklis
                        color: Colors.white, // Warna ceklis sesuai dengan tombol
                        size: 25, // Ukuran ikon
                      ),
                    ),
                    const SizedBox(width: 2), // Jarak antara ikon dan teks
                    const Text(
                      'Bayar Sekarang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
