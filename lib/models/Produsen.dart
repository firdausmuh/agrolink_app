class produk_produsen {
  final String title;
  final List<String> imageUrl;
  final String description;
  final String readyStock;
  final String category;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_produsen({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.readyStock,
    required this.category,
    required this.harga,
    required this.rating,
    required this.jumlah,
    required this.satuan,
  });
}

List<produk_produsen> produsens = [
  produk_produsen(
      title: "Basreng Daun Jeruk ",
      imageUrl: ['assets/images/produsen/Basreng_daun_jeruk.png'],
      description: "Basreng (bakso goreng) daun jeruk adalah camilan renyah yang terbuat dari bakso ikan yang digoreng hingga kering, kemudian diberi taburan daun jeruk untuk aroma segar dan rasa khas.",
      readyStock: "120 Gram",
      category: "Produk Produsen",
      harga: 15000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'gram'
  ),
  produk_produsen(
      title: "Bumbu Kari",
      imageUrl: ['assets/images/produsen/bumbu_kari.png'],
      description: "Bumbu kari siap saji adalah campuran rempah yang diracik secara praktis untuk membuat hidangan kari. Biasanya terdiri dari bahan seperti kunyit, ketumbar, jintan, dan santan bubuk.",
      readyStock: "50 Gram",
      category: "Produk Produsen",
      harga: 5000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'gram'
  ),
  produk_produsen(
      title: "Beras Premium",
      imageUrl: ['assets/images/produsen/beras_premium.png'],
      description: "Beras premium adalah jenis beras berkualitas tinggi dengan butiran utuh, bersih, dan mengkilap. Memiliki tekstur pulen dan aroma harum saat dimasak, beras ini cocok untuk hidangan istimewa.",
      readyStock: "50 Kg",
      category: "Produk Produsen",
      harga: 17000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];



