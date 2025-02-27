import 'package:agrolink/models/shop.dart';

class produk_retailer {
  final String title;
  final List<String> imageUrl;
  final String description;
  final String readyStock;
  final String category;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_retailer({
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

List<produk_retailer> retailers = [
  produk_retailer(
      title: "Selada Organik",
      imageUrl: ['assets/images/retailer/selada_organik.png', 'assets/images/retailer/selada_organik2.png'],
      description: "Selada organik adalah sayuran hijau segar yang ditanam tanpa menggunakan pestisida atau bahan kimia sintetis, menjadikannya pilihan sehat untuk konsumsi",
      readyStock: "20Kg",
      category: "Produk Retailer",
      harga: 20000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',
  ),
  produk_retailer(
      title: "Bawang Merah",
      imageUrl: ['assets/images/retailer/bawang_merah.png'],
      description: "Bawang merah adalah umbi rempah digunakan sebagai bumbu dasar masakan.  Aroma khas dan rasa yang sedikit manis ketika dimasak, bawang merah kaya akan senyawa antioksidan, vitamin C",
      readyStock: "20Pcs",
      category: "Produk Retailer",
      harga: 35000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',

  ),
  produk_retailer(
      title: "Wortel",
      imageUrl: ['assets/images/retailer/wortel.png'],
      description: "Wortel adalah sayuran yang dikenal kaya akan beta-karoten, vitamin A, dan serat. Wortel sering dikonsumsi mentah, dimasak dalam sup, atau dijadikan jus. Rasanya manis alami, menjadikannya populer untuk segala usia.",
      readyStock: "20Kg",
      category: "Produk Retailer",
      harga: 15000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',
  ),
];