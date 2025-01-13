import 'dart:ffi';

import 'package:flutter/material.dart';

class KeranjangCard extends StatefulWidget {

  final bool isSelected;
  final Function(bool?)? onSelectionChanged;
  final String? title;
  final String? description;
  final String? stok;
  final Double? harga;
  final String? imageUrl;

  const KeranjangCard({
    super.key,
    this.isSelected = false,
    this.onSelectionChanged,
    this.title,
    this.description,
    this.stok,
    this.harga,
    this.imageUrl,

  final int basePrice; // Harga satuan produk
  final String imagePath; // Path gambar produk
  final String productName; // Nama produk
  final String deskripsi;
  final String size; // Ukuran produk, misal 20 Kg
  final String category; // Kategori produk
  final Function(int)? onQuantityChanged; // Callback untuk perubahan harga

  const KeranjangCard({
    super.key,
    required this.basePrice,
    required this.imagePath,
    required this.productName,
    required this.deskripsi,
    required this.size,
    required this.category,
    this.onQuantityChanged,

  });

  @override
  State<KeranjangCard> createState() => _KeranjangCardState();
}

class _KeranjangCardState extends State<KeranjangCard> {
  int quantity = 1;

  int? basePrice;

  @override
  void initState() {
    super.initState();
    basePrice = widget.harga as int? ?? 25000;
  }


  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onQuantityChanged?.call(-widget.basePrice); // Kurangi total harga
      });
    }
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged?.call(widget.basePrice); // Tambah total harga
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Checkbox(
                value: widget.isSelected,
                onChanged: widget.onSelectionChanged,
                activeColor:
                    Colors.green, // Ganti warna saat checkbox tercentang
                checkColor: Colors.white, // Warna centang (tanda centang)
                // Warna untuk checkbox saat tidak tercentang
                hoverColor: Colors.grey, // Warna saat dihover
                // inactiveThumbColor: Colors.grey, // Warna kotak checkbox tidak tercentang
                // inactiveBorderColor: Colors., // Warna border saat tidak tercentang
              ),
              const SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/toko/shop_image.png'),
                    fit: BoxFit.cover,

          // Gambar Produk
          Container(
            width: 95,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imagePath, // Gambar produk yang dinamis
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Informasi Produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Text(
                  widget.productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                // Deskripsi Produk
                Text(
                  widget.deskripsi,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'Total Satuan: ${widget.size}', // Menampilkan ukuran produk
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.imageUrl ?? 'assets/images/profile1.png',
                    fit: BoxFit.cover,

                const SizedBox(height: 6),
                Text(
                  'Jenis Produk: ${widget.category}', // Menampilkan kategori produk
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,

                  ),
                ),
                const SizedBox(height: 8),
                // Kuantitas dan Harga Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      widget.title ?? 'Burger With Meat',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.description ?? 'Bayam adalah sayuran enak untuk',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.stok ?? 'Stok : 50 Biji',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Tombol untuk menambah/mengurangi kuantitas

                    Row(
                      children: [
                        InkWell(
                          onTap: decreaseQuantity,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(Icons.remove, size: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),

                        Text(
                          formatPrice(basePrice ?? 0 * quantity),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                        InkWell(
                          onTap: increaseQuantity,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(Icons.add, size: 16),
                            ),

                          ),
                        ),
                      ],
                    ),
                    // Harga Total Produk
                    Text(
                      'Rp. ${widget.basePrice * quantity}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
