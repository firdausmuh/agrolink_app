import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UploadProdukScreen extends StatefulWidget {
  final List<Map<String, dynamic>> produkList;

  const UploadProdukScreen({Key? key, required this.produkList}) : super(key: key);

  @override
  State<UploadProdukScreen> createState() => _UploadProdukScreenState();
}

class _UploadProdukScreenState extends State<UploadProdukScreen> {
  File? _image;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _minimalPembelianController =
  TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kualitasController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final savedImage = await imageFile.copy('$path/$fileName.png');

      setState(() {
        _image = savedImage;
      });
    }
  }

  void _upload() {
    if (_namaController.text.isNotEmpty &&
        _hargaController.text.isNotEmpty &&
        _image != null) {
      // Membuat salinan list produk yang dapat dimodifikasi
      List<Map<String, dynamic>> updatedList = List.from(widget.produkList);

      // Tambahkan produk baru ke daftar produk yang dapat dimodifikasi
      updatedList.add({
        'nama': _namaController.text,
        'harga': _hargaController.text,
        'deskripsi': _deskripsiController.text,
        'minimalPembelian': _minimalPembelianController.text,
        'alamat': _alamatController.text,
        'kualitas': _kualitasController.text,
        'image': _image,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Upload berhasil!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Kembali ke layar sebelumnya dengan data yang diperbarui
      Navigator.pop(context, updatedList);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lengkapi semua data!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Upload Produk',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    onPressed: _pickImage,
                    child: const Text(
                      'Tambah Foto',
                      style: TextStyle(color: Color(0xFF406A52)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: _image != null
                    ? Center(
                  child: Image.file(
                    _image!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                    : const Center(
                  child: Text(
                    "Belum ada gambar",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildInputField(
                  'Nama Produk', 'Masukkan nama produk', _namaController),
              buildInputField(
                  'Harga Produk', 'Masukkan harga produk', _hargaController),
              buildInputField(
                  'Deskripsi Produk',
                  'Masukkan deskripsi produk',
                  _deskripsiController,
                  maxLines: 3),
              buildInputField(
                  'Minimal Pembelian',
                  'Masukkan minimal pembelian',
                  _minimalPembelianController),
              buildInputField(
                  'Alamat Produk', 'Masukkan alamat produk', _alamatController),
              buildInputField(
                  'Kualitas Produk',
                  'Masukkan kualitas produk (contoh: A, Premium)',
                  _kualitasController),
              const SizedBox(height: 10),
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
                  onPressed: _upload,
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

  Widget buildInputField(
      String label, String hint, TextEditingController controller,
      {int maxLines = 1}) {
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
            controller: controller,
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
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
        ],
      ),
    );
  }
}
