import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:flutter/material.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {

  void totalHarga() {

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Keranjang',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  KeranjangCard(),
                  KeranjangCard(),
                  KeranjangCard(),
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
              Text('Total', style: TextStyle(
                color: Color(0xFF406A52),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),
              Text('Rp. 40.000', style: TextStyle(
                color: Color(0xFF406A52),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: ElevatedButton(
          //       onPressed: () {}, style: ElevatedButton.styleFrom(
          //       backgroundColor: Color(0xFF406A52),
          //
          //   ), child: Text('Beli Sekarang', style: TextStyle(color: Colors.white),)),
          // ),
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
                backgroundColor: Color(0xFF406A52),
              ),
              child: Text(
                'Beli Sekarang',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

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
//   // Menyimpan harga dan jumlah item di keranjang
//   int totalHarga = 0;
//   List<int> hargaItem = [25000, 30000, 15000]; // contoh harga per item
//   List<int> jumlahItem = [1, 1, 1]; // jumlah item di keranjang, bisa ditambah atau dikurangi
//
//   void updateTotalHarga() {
//     setState(() {
//       totalHarga = 0;
//       for (int i = 0; i < hargaItem.length; i++) {
//         totalHarga += hargaItem[i] * jumlahItem[i];
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     updateTotalHarga(); // Memperbarui total harga saat tampilan di-render ulang
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20),
//           const Text(
//             'Keranjang',
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Tampilan daftar produk di keranjang
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 children: List.generate(hargaItem.length, (index) {
//                   return KeranjangCard(
//                     harga: hargaItem[index],
//                     quantity: jumlahItem[index],
//                     onQuantityChanged: (newQuantity) {
//                       setState(() {
//                         jumlahItem[index] = newQuantity;
//                       });
//                     },
//                   );
//                 }),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Tampilan Total
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Total',
//                 style: TextStyle(
//                   color: Color(0xFF406A52),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 24,
//                 ),
//               ),
//               Text(
//                 'Rp. ${totalHarga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
//                 style: const TextStyle(
//                   color: Color(0xFF406A52),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 24,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           // Tombol Beli Sekarang
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Navigasi ke halaman checkout
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CheckoutScreen()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF07DF62),
//               ),
//               child: const Text(
//                 'Beli Sekarang',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }

