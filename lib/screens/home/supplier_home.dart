import 'package:flutter/material.dart';
import '../../components/produk_supplier/supplier_card.dart';
import '../../models/Supplier.dart';
import '../produk_supplier/detail_supplier_screen.dart';
import '../profile/profile_screen.dart';

class SupplierHome extends StatelessWidget {
  const SupplierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey Muhamad Firdaus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selamat datang di Agrolink',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('assets/images/profile2.png'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Temukan produk yang kamu inginkan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrangeAccent,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Produk Supplier...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey, // Warna garis
                          width: 1.5, // Ketebalan garis
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.grey, // Warna garis saat tidak fokus
                          width: 1.5, // Ketebalan garis
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Colors.blue, // Warna garis saat fokus
                          width: 2.0, // Ketebalan garis saat fokus
                        ),
                      ),
                    ),
                    onSubmitted: (query) {
                      print('Searching for: $query');
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow, // Warna latar belakang
                      border: Border.all(
                        color: Colors.yellow, // Warna garis persegi
                        width: 6, // Ketebalan garis
                      ),
                      borderRadius: BorderRadius.circular(8), // Membuat sudut persegi lebih lembut
                    ),
                    padding: const EdgeInsets.all(8), // Spasi di sekitar ikon
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.deepOrange, // Warna ikon
                      size: 24, // Ukuran ikon
                    ),
                  ),
                  onPressed: () {
                    print('Filter button pressed');
                  },
                ),

              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Produk-produk supplier',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Buat momen istimewamu belanja produk supplier',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),  // Adjusted padding to remove side margin
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: suppliers.map((supplier) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailSupplierScreen(
                                                supplier: supplier,
                                              ))),
                                },
                                child: SupplierCard(
                                  name: supplier.title,
                                  description: supplier.description,
                                  readyStock: supplier.readyStock,
                                  category: supplier.category,
                                  price: supplier.harga,
                                  imageUrl: supplier.imageUrl[0],
                                  onAddPressed: () {
                                    // Handle add to cart action
                                    SnackBar(
                                      content: Text(
                                          "${supplier.title} masuk ke keranjang"),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



