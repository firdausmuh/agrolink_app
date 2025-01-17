class produk_produsen {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_produsen({
    required this.title,
    required this.description,
    required this.readyStock,
    required this.category,
    required this.imageUrl,
    required this.harga,
    required this.rating,
    required this.jumlah,
    required this.satuan,
  });
}

List<produk_produsen> produsens = [
  produk_produsen(
      title: "Sayur Kangkung",
      description: "Kangkung yang memiliki nama ilmiah Ipomoea aquatica adalah salah satu sayuran hijau",
      readyStock: "20Pack",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/sayur_kangkung1.png'],
      harga: 6000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_produsen(
      title: "Sayur Sawi Jadi",
      description: "Sawi adalah jenis sayuran hijau",
      readyStock: "20Pcs",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/sayur_sawi1.png'],
      harga: 2000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_produsen(
      title: "Buah Naga Segar",
      description: "Buah naga dikenal sebagai adalah buah tropis dan merupakan buah segar sehat untuk badan",
      readyStock: "20Kg",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/buah_naga1.png'],
      harga: 9000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];