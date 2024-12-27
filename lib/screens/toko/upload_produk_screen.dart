import 'package:flutter/material.dart';

class UploadProdukScreen extends StatefulWidget {
  const UploadProdukScreen({super.key});

  @override
  State<UploadProdukScreen> createState() => _UploadProdukScreenState();
}

class _UploadProdukScreenState extends State<UploadProdukScreen> {
  final List<String> uploadedImages = [];

  void addPhoto() {
    // Tambahkan logika untuk memilih foto dari galeri
    setState(() {
      uploadedImages.add('assets/images/produsen/sawi.png'); // Contoh gambar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF406A52),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Upload Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Produk dan Tambah Foto
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Foto Produk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: addPhoto,
                    child: const Text(
                      'Tambah Foto',
                      style: TextStyle(color: Color(0xFF406A52)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Box Foto Produk dengan Scroll Horizontal
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: uploadedImages.isEmpty
                    ? Center(
                  child: GestureDetector(
                    onTap: addPhoto,
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: uploadedImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(uploadedImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Supported Format dan Maksimal Ukuran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Supported Format: JPG, PNG',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    'Maks: 23MB',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Isi nama produk
              const Text(
                'Isi nama produk yang kamu jual',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              buildInputField('Nama Produk', 'Masukkan nama produk'),
              buildInputField('Kategori Produk', 'Masukkan kategori produk'),
              buildInputField('Alamat Produk', 'Masukkan alamat produk'),
              buildInputField('Stok Tersedia', 'Masukkan stok tersedia'),
              buildInputField('Minimum Pemesanan', 'Masukkan minimum pemesanan'),
              buildInputField('Kondisi Produk', 'Masukkan kondisi produk'),
              buildInputField('Deskripsi Produk', 'Masukkan deskripsi produk',
                  maxLines: 5),
              const SizedBox(height: 20),
              // Tombol Upload Produk
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF406A52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Logika upload produk
                  },
                  child: const Text(
                    'Upload Produk',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 5),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF406A52)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15),
            ),
          ),
        ],
      ),
    );
  }
}
