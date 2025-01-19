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
      title: "Kopi Song Lim SW",
      description: "Kopi Song Lim SW adalah perpaduan kopi berkualitas tinggi yang menawarkan cita rasa khas dan aroma yang menggugah selera.",
      readyStock: "20Kg",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/kopi_kemasan.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_distributor(
      title: "Madu Alsifa",
      description: "Madu Alsifa adalah madu murni berkualitas tinggi yang dihasilkan dari lebah pilihan, menawarkan rasa manis alami dan manfaat kesehatan yang melimpah",
      readyStock: "20Pcs",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/madu_asli.png'],
      harga: 15000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_distributor(
      title: "Sabun Herba Bidara",
      description: "Sabun Herba Bidara adalah sabun alami yang diformulasikan dengan ekstrak daun bidara, dikenal karena manfaatnya dalam merawat kesehatan kulit.",
      readyStock: "20Kg",
      category: "Produk Distributor",
      imageUrl: ['assets/images/distributor/sabun_herba.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];