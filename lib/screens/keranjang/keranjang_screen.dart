import 'package:flutter/material.dart';
import 'package:agrolink/components/keranjang/keranjang_card.dart';
import 'package:agrolink/screens/keranjang/checkout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  List<List<String>> cartItems = []; // Daftar untuk menyimpan item keranjang

  @override
  void initState() {
    super.initState();
    _getPrefs(); // Memuat item keranjang dari SharedPreferences
  }

  Future<void> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsString = prefs.getStringList('cart_items');

    if (cartItemsString != null) {
      setState(() {
        cartItems = cartItemsString.map((item) {
          return item.split(','); // Mengonversi string ke List<String>
        }).toList();
      });
    }
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      if (item.length > 4) { // Pastikan item memiliki cukup elemen
        double price = double.tryParse(item[5] ?? '0') ?? 0; // Pastikan price valid
        int quantity = int.tryParse(item[4].split(' ')[0] ?? '1') ?? 1; // Pastikan quantity valid
        total += price * quantity; // Hitung total berdasarkan harga dan kuantitas
      } else {
        // Jika item tidak memiliki cukup elemen, cetak peringatan
        print("Item tidak valid: $item");
      }
    }
    return total;
  }

  void _removeItem(int index) async {
    setState(() {
      cartItems.removeAt(index);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedCartItems =   cartItems.map((item) => item.join(',')).toList();
    await prefs.setStringList('cart_items', updatedCartItems);
  }

  // void _updateQuantity(int index, int quantity) async {
  //   setState(() {
  //     if (cartItems[index].length > 4) {
  //       //String size = cartItems[index][3].split(' ')[1]; // Ambil satuan
  //       cartItems[index][3] = quantity.toString(); // Update quantity
  //     } else {
  //       print("Tidak dapat memperbarui kuantitas, item tidak valid: ${cartItems[index]}");
  //     }
  //   });
  //
  //   // Perbarui SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> updatedCartItems = cartItems.map((item) => item.join(',')).toList();
  //   await prefs.setStringList('cart_items', updatedCartItems);
  // }

  void _updateQuantity(int index, int quantity) async {
    setState(() {
      if (cartItems[index].length > 4) {
        // Update kuantitas di cartItems
        cartItems[index][4] = '$quantity ${cartItems[index][4].split(' ')[1]}'; // Format: "quantity satuan"
      } else {
        print("Tidak dapat memperbarui kuantitas, item tidak valid: ${cartItems[index]}");
      }
    });

    // Perbarui SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedCartItems = cartItems.map((item) => item.join(',')).toList();
    await prefs.setStringList('cart_items', updatedCartItems);
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return KeranjangCard(
                    title: item[1],
                    description: item[2],
                    imageUrl: item[0],
                    selectSize: item[4], // Ukuran produk tetap
                    harga: double.tryParse(item[5]) ?? 0,
                    onDelete: () => _removeItem(index),
                    onQuantityChanged: (quantity) {
                      _updateQuantity(index, quantity);
                      setState(() {}); // Memanggil setState untuk memperbarui tampilan
                    }, // Callback untuk update kuantitas
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
                  'Rp. ${calculateTotal().toStringAsFixed(2)}',
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
                      builder: (context) => CheckoutScreen(cartItems: cartItems),
                    ),
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
      ),
    );
  }
}
