import 'package:flutter/material.dart';

class KeranjangCard extends StatefulWidget {
  final String? title;
  final String? description;
  final String? stok;
  final String? category; // Pastikan ini ada
  final double? harga; // Harga satuan
  final String? imageUrl;
  final String? selectSize; // Ukuran produk
  final Function()? onDelete;
  final Function(int quantity)? onQuantityChanged; // Callback untuk perubahan kuantitas

  const KeranjangCard({
    super.key,
    this.title,
    this.description,
    this.stok,
    this.category,
    this.harga,
    this.imageUrl,
    this.selectSize,
    this.onDelete,
    this.onQuantityChanged, // Inisialisasi callback
  });

  @override
  State<KeranjangCard> createState() => _KeranjangCardState();
}

class _KeranjangCardState extends State<KeranjangCard> {
  int quantity = 1; // Inisialisasi quantity dengan nilai default

  @override
  void initState() {
    super.initState();
    // Tidak perlu mengubah quantity dari size
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onQuantityChanged?.call(quantity); // Panggil callback dengan kuantitas baru
      });
    }
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged?.call(quantity); // Panggil callback dengan kuantitas baru
    });
  }

  String formatPrice(double price) {
    return 'Rp. ${price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  @override
  Widget build(BuildContext context) {
    double unitPrice = widget.harga ?? 0;
    double totalPrice = unitPrice * quantity;
    return Container(
      padding: const EdgeInsets.all(16),
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
          Container(
            width: 95,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imageUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? 'Nama Produk',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: widget.onDelete,
                    ),
                  ],
                ),
                Text(
                  widget.description ?? 'Deskripsi Produk',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      'Jumlah produk : ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.selectSize ?? '', // Ukuran produk tetap
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      'Jenis : ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.category ?? '', // Pastikan ini ada
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: decreaseQuantity,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.rectangle,
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
                        InkWell(
                          onTap: increaseQuantity,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(Icons.add, size: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      formatPrice(totalPrice), // Hitung total harga berdasarkan kuantitas
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
