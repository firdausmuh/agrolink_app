  import 'dart:io';
  import 'package:agrolink/screens/toko/upload_produk_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';

import 'PesananScreen.dart';
  
  class TokoScreen extends StatefulWidget {
  
    const TokoScreen({Key? key}) : super(key: key);
    @override
    _TokoScreenState createState() => _TokoScreenState();
  }
  
  class _TokoScreenState extends State<TokoScreen> {
    List<Map<String, dynamic>> produkList = [];
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Toko Saya",
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
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                    AssetImage('assets/images/profile/profile1.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF406A52),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                        onPressed: () {
                          // Aksi edit
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Lydia Garden Store',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 12),
                  SizedBox(width: 5),
                  Text(
                    'Online Yogyakarta',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        produkList.length.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Produk di Toko',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const Column(
                    children: [
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
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  GestureDetector( // Menggunakan GestureDetector untuk navigasi
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PesananScreen()),
                      );
                    },
                    child: const Column(
                      children: [
                        Text(
                          'Pesanan',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Cek Pesanan',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
  
              // Daftar produk
              Expanded(
                child: produkList.isNotEmpty
                    ? ListView.builder(
                  itemCount: produkList.length,
                  itemBuilder: (context, index) {
                    final produk = produkList[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          // Gambar produk
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade200,
                            ),
                            child: produk['image'] != null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                produk['image'],
                                fit: BoxFit.cover,
                              ),
                            )
                                : const Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Detail produk
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  produk['nama'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _formatCurrency(produk['harga']),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  produk['deskripsi'] ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      'Minimal Pembelian: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      produk['minimalPembelian'] ?? 'Tidak ada',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      'Kualitas: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      produk['kualitas'] ?? 'Tidak ada',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      maxLines: 3,
                                      'Alamat: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      maxLines: 3,
                                      produk['alamat'] ?? 'Tidak ada',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ) : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/animasi_kosong.png',
                        height: 250,
                        width: 250,
                      ),
                      const Text(
                        'Belum ada produk ditoko',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
  
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF406A52),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    UploadProdukScreen(produkList: produkList),
              ),
            ).then((updatedList) {
              if (updatedList != null) {
                setState(() {
                  produkList = updatedList;
                });
              }
            });
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      );
    }
  
    String _formatCurrency(String value) {
      final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
      try {
        return formatter.format(int.parse(value));
      } catch (_) {
        return 'Rp 0';
      }
    }
  }
  
