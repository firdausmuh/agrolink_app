import 'package:agrolink/screens/toko/toko_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UploadProdukScreen extends StatefulWidget {
  const UploadProdukScreen({super.key});

  @override
  State<UploadProdukScreen> createState() => _UploadProdukScreenState();
}

class _UploadProdukScreenState extends State<UploadProdukScreen> {
  final List<String> uploadedImages = [];
  File? _image;
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final savedImage = await imageFile.copy('$path/$fileName.png');

      print(savedImage);

      setState(() {
        _image = savedImage;
      });
    }
  }

  void _upload() {
    if (_namaController.text != '' &&
        _hargaController.text != '' &&
        _image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Upload success"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TokoScreen(
              namaProdukUpload: _namaController.text,
              hargaProdukUpload: _hargaController.text,
              imageProdukUpload: _image),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Check missing data!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void addPhoto() {
    // Tambahkan logika untuk memilih foto dari galeri
    setState(() {
      // update by faiz
      uploadedImages.add(
          'assets/images/produsen/sayur_sawi3sayur_sawi3.png'); // Contoh gambar
      // update by faiz
      uploadedImages.add('assets/images/produsen/buah_naga1.png',);// Contoh gambar
      // update by faiz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
                    onPressed: _pickImage,
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
                  // update by faiz
                  child: _image != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.file(
                                  _image!,
                                  height: 250,
                                  width: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: ElevatedButton(
                            onPressed: _pickImage,
                            child: const Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: Colors.grey,
                            ),
                  // update by faiz
                )
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: uploadedImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(uploadedImages[index]),
                            fit: BoxFit.cover,
                  // update by faiz
                          ),
                        )),
              const SizedBox(height: 10),
              // Supported Format dan Maksimal Ukuran
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              buildInputField(
                  'Nama Produk', 'Masukkan nama produk', _namaController),
              buildInputField(
                  'Harga Produk', 'Masukkan nama produk', _hargaController),
              buildInputField('Kategori Produk', 'Masukkan kategori produk',
                  _textController),
              buildInputField(
                  'Alamat Produk', 'Masukkan alamat produk', _textController),
              buildInputField(
                  'Stok Tersedia', 'Masukkan stok tersedia', _textController),
              buildInputField('Minimum Pemesanan', 'Masukkan minimum pemesanan',
                  _textController),
              buildInputField(
                  'Kondisi Produk', 'Masukkan kondisi produk', _textController),
              buildInputField('Deskripsi Produk', 'Masukkan deskripsi produk',
                  _textController,
                  maxLines: 5),
              const SizedBox(height: 10),
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
                  // Logika upload produk dan menampilkan snackbar
                  onPressed: () {
                    // update by faiz
                    // Logika upload produk
                    _upload();
                    // update by faiz
                    showTopSnackBar(context, 'Produk telah berhasil di Upload');
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pop(context);
                    });
                    // update by faiz
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

  // showsnackbar above not from bellow
  void showTopSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Posisi di bawah status bar
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Menghapus snackbar setelah 3 detik
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

}
