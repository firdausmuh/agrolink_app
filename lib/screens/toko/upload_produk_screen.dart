import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UploadProdukScreen extends StatefulWidget {
  final List<Map<String, dynamic>> produkList;
  final int? index; // Tambahkan parameter index
  final bool isEdit;

  const UploadProdukScreen({
    Key? key,
    required this.produkList,
    this.index,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<UploadProdukScreen> createState() => _UploadProdukScreenState();
}

class _UploadProdukScreenState extends State<UploadProdukScreen> {
  File? _image;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _stokTersediaController = TextEditingController();
  final TextEditingController _ketahananController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      // Jika index tidak null, isi data produk untuk diedit
      final produk = widget.produkList[widget.index!];
      _namaController.text = produk['nama'];
      _hargaController.text = produk['harga'];
      _deskripsiController.text = produk['deskripsi'];
      _stokTersediaController.text = produk['stoktersedia'];
      _ketahananController.text = produk['ketahanan'];
      _kategoriController.text = produk['kategori'];
      _image = File(produk['image']); // Mengambil path gambar
    }
  }

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
    // Validasi harga harus berupa angka
    final harga = _hargaController.text;
    final isHargaValid = double.tryParse(harga) != null;

    // Validasi stok: bisa berupa angka atau string dengan satuan (Gram, Kg, Ton)
    final stok = _stokTersediaController.text;
    final isStokValid = double.tryParse(stok) != null ||
        stok.toLowerCase().endsWith('gram') ||
        stok.toLowerCase().endsWith('kg') ||
        stok.toLowerCase().endsWith('ton');

    // Memeriksa apakah semua field telah diisi dan format harga/stok valid
    if (_namaController.text.isEmpty ||
        _hargaController.text.isEmpty ||
        _deskripsiController.text.isEmpty ||
        _stokTersediaController.text.isEmpty ||
        _ketahananController.text.isEmpty ||
        _kategoriController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data produk harus diisi dengan lengkap"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return; // Menghentikan proses upload jika ada field yang kosong
    } else if (!isHargaValid || !isStokValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Harga dan stok produk harus berupa angka valid"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return; // Menghentikan proses upload jika format harga/stok tidak valid
    }

    // Membuat salinan list produk yang dapat dimodifikasi
    List<Map<String, dynamic>> updatedList = List.from(widget.produkList);

    if (widget.index != null) {
      // Jika index tidak null, update produk yang ada
      updatedList[widget.index!] = {
        'nama': _namaController.text,
        'harga': _hargaController.text,
        'deskripsi': _deskripsiController.text,
        'stoktersedia': _stokTersediaController.text,
        'ketahanan': _ketahananController.text,
        'kategori': _kategoriController.text,
        'image': _image!.path, // Simpan path gambar
      };
    } else {
      // Tambahkan produk baru ke daftar produk yang dapat dimodifikasi
      updatedList.add({
        'nama': _namaController.text,
        'harga': _hargaController.text,
        'deskripsi': _deskripsiController.text,
        'stoktersedia': _stokTersediaController.text,
        'ketahanan': _ketahananController.text,
        'kategori': _kategoriController.text,
        'image': _image!.path, // Simpan path gambar
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Upload produk berhasil!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // Kembali ke layar sebelumnya dengan data yang diperbarui
    Navigator.pop(context, updatedList);
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
        title: Text(
          widget.isEdit ? 'Update Produk' : 'Upload Produk', // Mengubah judul berdasarkan parameter
          style: const TextStyle(
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
              buildInputField('Nama Produk', 'Masukkan nama produk', _namaController),
              buildInputField('Kategori Produk', 'Masukkan kategori produk', _kategoriController),
              buildInputField('Harga Produk', 'Masukkan harga produk', _hargaController),
              buildInputField('Stok Tersedia', 'Masukkan Jumlah Stok Tersedia', _stokTersediaController),
              buildInputField('Ketahanan Produk', 'Masukkan ketahanan produk', _ketahananController),
              buildInputField('Deskripsi Produk', 'Masukkan deskripsi produk', _deskripsiController, maxLines: 3),

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
                  child: Text(
                    widget.isEdit ? 'Update Produk' : 'Upload Produk', // Mengubah teks tombol berdasarkan parameter
                    style: const TextStyle(color: Colors.white, fontSize: 16),
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
