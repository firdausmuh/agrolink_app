import 'package:agrolink/models/shop.dart';

class produk_retailer {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_retailer({
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

List<produk_retailer> retailers = [
  produk_retailer(
      title: "Beras Premium",
      description: "Beras Premium adalah jenis beras berkualitas tinggi yang biasanya memiliki ciri-ciri tertentu berdasarkan standar pengolahan, tekstur, warna, dan rasa. Beras ini sering menjadi pilihan utama bagi konsumen yang menginginkan nasi yang pulen, bersih, dan lezat. Ciri-ciri Beras Premium: Ukuran butirnya seragam dan utuh, Bebas dari butir patah, kotoran, atau gabah. Tidak mengandung campuran jenis beras lain.",
      readyStock: "20Kg",
      category: "Produk Retailer",
      imageUrl: ['assets/images/retailer/beras.png', 'assets/images/retailer/beras.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',
  ),
  produk_retailer(
      title: "Keripik Kentang",
      description: "Keripik Kentang adalah camilan populer yang terbuat dari irisan tipis kentang yang digoreng hingga renyah. Camilan ini memiliki tekstur renyah, rasa gurih, dan sering diolah dengan berbagai bumbu tambahan untuk menambah variasi rasa.",
      readyStock: "20Pcs",
      category: "Produk Retailer",
      imageUrl: ['assets/images/retailer/keripik_kentang.png', 'assets/images/retailer/keripik_kentang.png'],
      //shopImage: ['assets/images/toko/jagung'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs',

  ),
  produk_retailer(
      title: "Selada Organik",
      description: "Selada Organik adalah jenis sayuran hijau yang ditanam tanpa penggunaan pestisida kimia, pupuk sintetis, atau bahan tambahan berbahaya lainnya. Selada ini menjadi pilihan populer bagi mereka yang mengutamakan gaya hidup sehat dan peduli terhadap lingkungan.",
      readyStock: "20Kg",
      category: "Produk Retailer",
      imageUrl: ['assets/images/retailer/selada_organik.png', 'assets/images/retailer/selada_organik.png'],
      //shopImage: ['assets/images/toko/jagung'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',
  ),
];