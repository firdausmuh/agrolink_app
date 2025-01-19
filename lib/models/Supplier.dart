class produk_supplier {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_supplier({
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

List<produk_supplier> suppliers = [
  produk_supplier(
    title: "Benihi Jagung",
    description: "Benih jagung adalah bibit tanaman yang digunakan untuk menanam jagung. Tersedia dalam berbagai varietas yang dapat disesuaikan dengan iklim dan kebutuhan petani",
    readyStock: "50 Buah",
    category: "Produk Supplier",
    imageUrl: ['assets/images/produk_supplier/benih_jagung.png',],
    harga: 2000,
    rating: 4.2,
    jumlah: [10, 20, 30, 40, 50, 60],
    satuan: 'Kg'
  ),
  produk_supplier(
      title: "Pupuk Organik",
      description: "Pupuk organik adalah pupuk yang terbuat dari bahan alami, seperti kompos, pupuk kandang, dan sisa-sisa tanaman. Pupuk ini kaya akan unsur hara yang dibutuhkan oleh tanaman.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/pupuk_organik.png',],
      harga: 3000,
      rating: 4.4,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'Kg'),
  produk_supplier(
      title: "Benih Padi",
      description: "Benih padi adalah bibit yang digunakan untuk menanam padi, tanaman utama penghasil beras. Benih padi berkualitas baik akan menghasilkan tanaman yang sehat dan produktif.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/benih_padi.png',],
      harga: 4000,
      rating: 4.1,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'Ton'),
];
