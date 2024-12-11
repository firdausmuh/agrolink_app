class produk_distributor {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_distributor({
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

List<produk_distributor> distributors = [
  produk_distributor(
      title: "Bumbu Kari Ayam",
      description: "Bumbu kari ayam adalah campuran rempah-rempah yang digunakan untuk membuat hidangan kari ayam yang kaya rasa, gurih, dan sedikit pedas. Berikut adalah daftar bumbu yang umumnya digunakan untuk membuat kari ayam: Bawang merah, bawang putih, jahe, kunyit, lengkuas, kemiri, dan cabai merah dan lain-lain",
      readyStock: "20Kg",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/bumbu_kari.png', 'assets/images/distributor/bumbu_kari.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_distributor(
      title: "Pakan Ayam",
      description: "Pakan ayam adalah makanan yang diberikan kepada ayam untuk mendukung pertumbuhannya, produksi telur, atau kualitas daging ayam. Pakan ayam yang baik harus mengandung berbagai nutrisi penting seperti protein, lemak, karbohidrat, vitamin, dan mineral.",
      readyStock: "20Pcs",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/pakan_ayam.png', 'assets/images/distributor/pakan_ayam.png'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_distributor(
      title: "Pupuk Organik",
      description: "Pupuk organik adalah jenis pupuk yang terbuat dari bahan-bahan alami, baik itu dari bahan nabati, hewani, atau mikroorganisme yang telah melalui proses dekomposisi. Pupuk ini digunakan untuk memperbaiki kualitas tanah, meningkatkan kesuburan tanah, serta memberikan nutrisi bagi tanaman secara alami. Pupuk organik tidak hanya mengandung unsur hara, tetapi juga bahan organik yang dapat memperbaiki struktur tanah, meningkatkan kapasitas penyerapan air, serta meningkatkan aktivitas mikroorganisme tanah.",
      readyStock: "20Kg",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/pupuk_organik.png', 'assets/images/distributor/pupuk_organik.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];