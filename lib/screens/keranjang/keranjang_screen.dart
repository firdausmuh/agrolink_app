import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:flutter/material.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  int totalPrice = 0; // Variabel untuk menyimpan total harga

  // Fungsi untuk memperbarui total harga
  void updateTotalPrice(int change) {
    setState(() {
      totalPrice += change;
    });
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
          "Keranjang Belanja",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Contoh penggunaan KeranjangCard
                    KeranjangCard(
                      basePrice: 20000, // Harga satuan produk
                      productName: "Beras Premium",
                      deskripsi: "Beras premium dengan kualitas terbaik.",
                      size: "20 Kg",
                      category: "Retailer",
                      onQuantityChanged: updateTotalPrice,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    KeranjangCard(
                      basePrice: 15000, // Harga satuan produk
                      productName: "Wortel Segar",
                      deskripsi: "Wortel segar langsung dari kebun.",
                      size: "10 Kg",
                      category: "Produsen",
                      onQuantityChanged: updateTotalPrice,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    color: Color(0xFF406A52),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Rp. ${totalPrice.toString()}', // Menampilkan total harga
                  style: const TextStyle(
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
                    MaterialPageRoute(
                        builder: (context) => const CheckoutScreen()),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 2),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}





