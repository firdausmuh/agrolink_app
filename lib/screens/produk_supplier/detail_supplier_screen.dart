import 'package:agrolink/models/Supplier.dart';
import 'package:agrolink/screens/produk_supplier/favorite_belanja_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../keranjang/keranjang_screen.dart';

class DetailSupplierScreen extends StatefulWidget {
  final produk_supplier supplier;
  const DetailSupplierScreen({super.key, required this.supplier});

  @override
  State<DetailSupplierScreen> createState() => _DetailBelanjaScreenState();
}

class _DetailBelanjaScreenState extends State<DetailSupplierScreen> {
  int selectedIndext = 0;

  _addCart() async {
    // Ambil jumlah yang dipilih oleh pengguna
    double selectedQuantity = widget.supplier.jumlah[selectedIndext];

    // Ambil jumlah stok yang tersedia (dalam Kg)
    double readyStock = double.parse(widget.supplier.readyStock.split(' ')[0]);

    // Periksa apakah jumlah yang dipilih melebihi stok yang tersedia dan lebih dari 30 Kg
    if (selectedQuantity > readyStock || selectedQuantity > 30) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Jumlah Produk Tidak Tersedia"),
          backgroundColor: Colors.red,
        ),
      );
      return; // Hentikan eksekusi jika kondisi terpenuhi
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cart_items') ?? [];

    // Ambil ukuran/jumlah yang dipilih
    String selectedSize = '${widget.supplier.jumlah[selectedIndext]} ${widget.supplier.satuan}';

    // Buat string untuk produk
    String newItem = '${widget.supplier.imageUrl[0]},${widget.supplier.title},${widget.supplier.description},${selectedSize},${widget.supplier.harga}';

    // Tambahkan item baru ke keranjang
    cartItems.add(newItem);

    // Simpan kembali ke SharedPreferences
    await prefs.setStringList('cart_items', cartItems);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully added to cart!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const KeranjangScreen()));
  }

  String formatCurrency(double value) {
    final formatter =
    NumberFormat("#,##0", "id_ID"); // Locale for Indonesian formatting
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.supplier.title,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.supplier.imageUrl.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(
                              widget.supplier.imageUrl[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.supplier.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                            ),
                            Text(
                              'Rp ' +
                                  formatCurrency(widget.supplier.harga)
                                      .toString(),
                              style: const TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.withOpacity(0.8),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '4.8',
                              style: TextStyle(
                                  color: Colors.orange.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Text(
                              'Pilih Jumlah beli',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 44,
                          child: ListView.builder(
                              itemCount: widget.supplier.jumlah.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final bool isSelected = selectedIndext == index;

                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => {
                                        setState(() {
                                          selectedIndext = index;
                                        })
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? const Color(0xFFD3B398)
                                                : Colors.black.withOpacity(0.1),
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Text(
                                          '${widget.supplier.jumlah[index].toInt()} ${widget.supplier.satuan}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black
                                                  .withOpacity(0.3)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                );
                              }),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Text(
                              'Deskripsi',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.supplier.description,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteBelanjaScreen()),
                    ),
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 24,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _addCart();
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Tambahkan ke Keranjang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
