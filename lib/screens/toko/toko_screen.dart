// import 'package:agrolink/screens/toko/upload_produk_screen.dart';
// import 'package:flutter/material.dart';
//
// class TokoScreen extends StatelessWidget {
//   const TokoScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Toko Saya',
//           style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
//
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//         ),
//
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             // Gambar lingkaran dengan ikon pensil
//             Stack(
//               children: [
//                 const CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/images/profile1.png'), // Ganti dengan gambar toko
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 60,
//                   // right: 20,
//                   child: IconButton(
//                     icon: const Icon(Icons.edit, color: Colors.white),
//                     color: const Color(0xFF406A52),
//                     onPressed: () {
//                       // Aksi edit
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // Nama toko
//             const Text(
//               'Lydia Garden Store',
//               style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 5),
//             // Status dan alamat
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.circle, color: Colors.green, size: 12),
//                 SizedBox(width: 5),
//                 Text(
//                   'Online Yogyakarta',
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Grid dengan informasi toko
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Produk di toko
//                 Column(
//                   children: const [
//                     Text(
//                       '5',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Produk di Toko',
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 // Garis pemisah
//                 Container(
//                   height: 40,
//                   width: 1,
//                   color: Colors.grey.shade300,
//                 ),
//                 // Balas chat & diskusi
//                 Column(
//                   children: const [
//                     Text(
//                       '> 1 jam',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Balas Chat & Diskusi',
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 // Garis pemisah
//                 Container(
//                   height: 40,
//                   width: 1,
//                   color: Colors.grey.shade300,
//                 ),
//                 // Jam operasional toko
//                 Column(
//                   children: const [
//                     Text(
//                       'Buka 24 Jam',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Jam Operasional',
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Divider(),
//             const SizedBox(height: 10),
//             // Daftar produk
//             Expanded(
//               child: GridView.builder(
//                 itemCount: 5, // Jumlah produk
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 3 / 4,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Gambar produk
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               image: const DecorationImage(
//                                 image: AssetImage('assets/images/retailer/keripik_kentang.png'), // Ganti dengan gambar produk
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         // Nama produk
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'Nama Produk',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         // Harga produk
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'Rp 10.000',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFF406A52),
//         onPressed: () {
//           // Arahkan ke halaman tambah produk
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const UploadProdukScreen(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
//


import 'package:agrolink/screens/toko/upload_produk_screen.dart';
import 'package:flutter/material.dart';

class TokoScreen extends StatelessWidget {
  const TokoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Saya',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Gambar lingkaran dengan ikon pensil
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile1.png'), // Ganti dengan gambar toko
                ),
                Positioned(
                  bottom: 0, // Posisikan tombol edit di bawah lingkaran
                  right: 0, // Posisikan ke kanan
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF406A52), // Warna latar belakang
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero, // Hapus padding default dari IconButton
                      icon: const Icon(Icons.edit, size: 16, color: Colors.white), // Ikon pensil dengan warna putih
                      onPressed: () {
                        // Aksi edit
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Nama toko
            const Text(
              'Lydia Garden Store',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            // Status dan alamat
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 5),
                Text(
                  'Online Yogyakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Grid dengan informasi toko
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Produk di toko
                Column(
                  children: const [
                    Text(
                      '5',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Produk di Toko',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                // Garis pemisah
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                // Balas chat & diskusi
                Column(
                  children: const [
                    Text(
                      '> 1 jam',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Balas Chat & Diskusi',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                // Garis pemisah
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                // Jam operasional toko
                Column(
                  children: const [
                    Text(
                      'Buka 24 Jam',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Jam Operasional',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            // Daftar produk
            Expanded(
              child: GridView.builder(
                itemCount: 5, // Jumlah produk
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar produk
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/retailer/keripik_kentang.png'), // Ganti dengan gambar produk
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Nama produk
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Nama Produk',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Harga produk
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Rp 10.000',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF406A52),
        onPressed: () {
          // Arahkan ke halaman tambah produk
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UploadProdukScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

