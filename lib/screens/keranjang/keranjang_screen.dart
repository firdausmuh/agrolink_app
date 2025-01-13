// import 'package:agrolink/components/keranjang/keranjang_card.dart';
// import 'package:agrolink/screens/keranjang/checkout_screen.dart';
// import 'package:flutter/material.dart';
//
// class KeranjangScreen extends StatefulWidget {
//   const KeranjangScreen({super.key});
//
//   @override
//   State<KeranjangScreen> createState() => _KeranjangScreenState();
// }
//
// class _KeranjangScreenState extends State<KeranjangScreen> {
//   void totalHarga() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context); // Kembali ke layar sebelumnya
//           },
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//         ),
//         title: const Text(
//           'Keranjang',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w700,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Expanded(
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     KeranjangCard(),
//                     Divider(
//                       color: Colors.grey, // Warna garis
//                       thickness: 1, // Ketebalan garis
//                     ),
//                     KeranjangCard(),
//                     Divider(
//                       color: Colors.grey, // Warna garis
//                       thickness: 1, // Ketebalan garis
//                     ),
//                     KeranjangCard(),
//                     Divider(
//                       color: Colors.grey, // Warna garis
//                       thickness: 1, // Ketebalan garis
//                     ),
//                     KeranjangCard(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total',
//                   style: TextStyle(
//                     color: Color(0xFF406A52),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 24,
//                   ),
//                 ),
//                 Text(
//                   'Rp. 40.000',
//                   style: TextStyle(
//                     color: Color(0xFF406A52),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 24,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CheckoutScreen()), // Arahkan ke layar checkout
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF199D52),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   minimumSize: const Size(double.infinity, 40),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min, // Menyesuaikan ukuran tombol dengan konten
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(5), // Memberikan jarak antara ikon dan lingkaran
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle, // Bentuk lingkaran
//                       ),
//                       child: const Icon(
//                         Icons.check_circle_outline, // Ikon ceklis
//                         color: Colors.white, // Warna ceklis sesuai dengan tombol
//                         size: 25, // Ukuran ikon
//                       ),
//                     ),
//                     const SizedBox(width: 2), // Jarak antara ikon dan teks
//                     const Text(
//                       'Beli Sekarang',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:flutter/material.dart';


class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {

  final List<bool> selectedItems = List.filled(4, false);
  String? cartTitle;
  String? cartDescription;
  String? cartStock;
  String? cartImageUrl;
  Double? cartHarga;

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  Future<SharedPreferences?> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs;
  }

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

      body: FutureBuilder(
        future: _getPrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            SharedPreferences? prefs = snapshot.data;
            cartTitle = prefs?.getString('cart_title');
            cartDescription = prefs?.getString('cart_description');
            cartStock = prefs?.getString('cart_stock');
            cartImageUrl = prefs?.getString('cart_imageUrl');
            cartHarga = prefs?.getDouble('card_harga') as Double?;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return cartTitle != null
                            ? KeranjangCard(
                                isSelected: selectedItems[0],
                                onSelectionChanged: (value) {
                                  setState(() {
                                    selectedItems[index] = value ?? false;
                                  });
                                },
                                title: cartTitle,
                                description: cartDescription,
                                imageUrl: cartImageUrl,
                                stok: cartStock,
                                harga: cartHarga,
                              )
                            : KeranjangCard(
                                isSelected: selectedItems[index],
                                onSelectionChanged: (value) {
                                  setState(() {
                                    selectedItems[index] = value ?? false;
                                  });
                                },
                              );
                      },
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
                        'Rp. ${calculateTotal()}',
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
                        // Lanjutkan ke layar checkout hanya untuk item yang dipilih
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
                      ),
                      child: const Text(
                        'Beli Sekarang',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }
        },

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
                      imagePath: 'assets/images/retailer/beras.png',
                      productName: "Beras Premium",
                      deskripsi: "Beras premium adalah jenis beras berkualitas tinggi.",
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
                      imagePath: 'assets/images/retailer/selada_organik.png',
                      productName: "Wortel Segar",
                      deskripsi: "Selada organik adalah jenis sayuran hijau yang ditanam tanpa pestisida.",
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}





