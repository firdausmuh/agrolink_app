import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:flutter/material.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  void totalHarga() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    KeranjangCard(),
                    Divider(
                      color: Colors.grey, // Warna garis
                      thickness: 1, // Ketebalan garis
                    ),
                    KeranjangCard(),
                    Divider(
                      color: Colors.grey, // Warna garis
                      thickness: 1, // Ketebalan garis
                    ),
                    KeranjangCard(),
                    Divider(
                      color: Colors.grey, // Warna garis
                      thickness: 1, // Ketebalan garis
                    ),
                    KeranjangCard(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Color(0xFF406A52),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Rp. 40.000',
                  style: TextStyle(
                    color: Color(0xFF406A52),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()), // Arahkan ke layar checkout
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
                      decoration: const BoxDecoration(
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
                      'Beli Sekarang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


