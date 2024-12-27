import 'package:agrolink/screens/pembayaran/payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'COD';
  bool showNoteField = false;
  int totalHarga = 0;

  List<int> hargaItem = [25000, 30000, 15000];
  List<int> jumlahItem = [1, 1, 1];

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
    updateTotalHarga();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color(0xFF406A52),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                      'Terbansari gank v No.106, RT.04/RW.01, Terban, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey, thickness: 1),

              // Kartu Produk
              const SizedBox(height: 10),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row untuk Nama Toko dan Harga Total

                    Row(
                      children: [
                        Image.asset(
                          'assets/images/toko/shop_image.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Lydia Store',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Row untuk Gambar Produk dan Informasi Produk
                    Row(
                      children: [
                        // Gambar Produk
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/produk_supplier/bayam.png'), // Ganti sesuai aset Anda
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Detail Produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sayur Sawi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Keterangan: Fresh vegetables',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Request Stok: 50 pack',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    'Count: 2',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),


              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   elevation: 3,
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Image.asset(
              //               'assets/images/toko/shop_image.png',
              //               width: 40,
              //               height: 40,
              //             ),
              //             const SizedBox(width: 10),
              //             const Text(
              //               'Lydia Store',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 16,
              //               ),
              //             ),
              //           ],
              //         ),
              //         const Divider(color: Colors.grey, thickness: 1),
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Image.asset(
              //               'assets/images/produk_supplier/bayam.png',
              //               width: 100,
              //               height: 80,
              //               fit: BoxFit.cover,
              //             ),
              //             const SizedBox(width: 10),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: const [
              //                   Text(
              //                     'Sayur Sawi',
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w700,
              //                       fontSize: 16,
              //                     ),
              //                   ),
              //                   SizedBox(height: 5),
              //                   Text(
              //                     'Segar, kualitas terbaik.',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       color: Colors.grey,
              //                     ),
              //                   ),
              //                   SizedBox(height: 5),
              //                   Text(
              //                     'Request stok: 50 pack',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                     ),
              //                   ),
              //                   SizedBox(height: 5),
              //                   Text(
              //                     'Total count: 2',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Column(
              //               children: const [
              //                 Text(
              //                   'Rp. 30.000',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 16,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20),

              // Metode Pembayaran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    'Lihat semua',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Image.asset(
                  'assets/images/toko/icon_bca.png',
                  width: 40,
                  height: 40,
                ),
                title: const Text('BCA Virtual Account'),
                trailing: Radio<String>(
                  value: 'BCA Virtual Account',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/toko/icon_cod.png',
                  width: 35,
                  height: 35,
                ),
                title: const Text('COD (Bayar di tempat)'),
                trailing: Radio<String>(
                  value: 'COD (Bayar di tempat)',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1),
              ListTile(
                leading: const Icon(Icons.note_alt, color: Colors.grey),
                title: const Text('Kasih catatan'),
                trailing: IconButton(
                  icon: Icon(
                    showNoteField ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      showNoteField = !showNoteField;
                    });
                  },
                ),
              ),
              if (showNoteField)
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Catatan untuk penjual...',
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              const Divider(color: Colors.grey, thickness: 1),

              // Ringkasan Transaksi
              const Text(
                'Cek ringkasan transaksimu, yuk',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(height: 10),
              _buildSummaryRow('Total Harga (1 barang)', 'Rp. 25.000'),
              _buildSummaryRow('Total Ongkos Kirim', 'Rp. 50.000'),
              _buildSummaryRow('Total Biaya Proteksi', 'Rp. 5.000'),
              const Divider(color: Colors.grey, thickness: 1),
              _buildSummaryRow(
                'Total Tagihan',
                'Rp. 80.000',
                isTotal: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF199D52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'Bayar Sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
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
