import 'package:agrolink/models/shop.dart';

class produk_retailer {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final List<String> shopImage;
  final String namaToko;
  final double harga;
  final String statusPesanan;
  final String alamat;
  final double rating;
  final List<double> jumlah;
  final String satuan;
  //final Shop shop;

  produk_retailer({
    required this.title,
    required this.description,
    required this.readyStock,
    required this.category,
    required this.imageUrl,
    required this.shopImage,
    required this.namaToko,
    required this.alamat,
    required this.statusPesanan,
    required this.harga,
    required this.rating,
    required this.jumlah,
    required this.satuan,
    //required this.shop
  });
}

List<produk_retailer> retailers = [
  produk_retailer(
      title: "Beras Premium",
      description: "Beras Premium adalah jenis beras berkualitas tinggi yang biasanya memiliki ciri-ciri tertentu berdasarkan standar pengolahan, tekstur, warna, dan rasa. Beras ini sering menjadi pilihan utama bagi konsumen yang menginginkan nasi yang pulen, bersih, dan lezat. Ciri-ciri Beras Premium: Ukuran butirnya seragam dan utuh, Bebas dari butir patah, kotoran, atau gabah. Tidak mengandung campuran jenis beras lain.",
      readyStock: "20Kg",
      category: "Produk Retailer",
      namaToko: "Firdaus Store",
      alamat: "Yogyakarta",
      statusPesanan: "20 menit pesanan diproses",
      imageUrl: ['assets/images/retailer/beras.png', 'assets/images/retailer/beras.png'],
      //shopImage: ['assets/images/toko/jagung'],
      harga: 65000,
      rating: 3.2,
      shopImage: ['assets/images/retailer/beras.png'],
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',
      // shop: Shop(
      //     imageUrl: ["assets/images/retailer/beras.png"],
      //     namaToko: "Toko pak budi",
      //     // isOnline: isOnline,
      //     alamat: "yogyakarta",
      //     // rating: rating,
      //     // statusPesanan: statusPesanan
      // )
  ),
  produk_retailer(
      title: "Keripik Kentang",
      description: "Keripik Kentang adalah camilan populer yang terbuat dari irisan tipis kentang yang digoreng hingga renyah. Camilan ini memiliki tekstur renyah, rasa gurih, dan sering diolah dengan berbagai bumbu tambahan untuk menambah variasi rasa.",
      readyStock: "20Pcs",
      category: "Produk Retailer",
      namaToko: "Firdaus Store",
      alamat: "Yogyakarta",
      statusPesanan: "20 menit pesanan diproses",
      imageUrl: ['assets/images/retailer/keripik_kentang.png', 'assets/images/retailer/keripik_kentang.png'],
      //shopImage: ['assets/images/toko/jagung'],
      harga: 15000,
      rating: 4.2,
      shopImage: ['assets/images/retailer/beras.png'],
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs',
      // shop: Shop(
      //   imageUrl: ["https://via.placeholder.com/150"],
      //   namaToko: "Toko pak budi",
      //   // isOnline: isOnline,
      //   alamat: "yogyakarta",
      //   // rating: rating,
      //   // statusPesanan: statusPesanan
      // )
  ),
  produk_retailer(
      title: "Selada Organik",
      description: "Selada Organik adalah jenis sayuran hijau yang ditanam tanpa penggunaan pestisida kimia, pupuk sintetis, atau bahan tambahan berbahaya lainnya. Selada ini menjadi pilihan populer bagi mereka yang mengutamakan gaya hidup sehat dan peduli terhadap lingkungan.",
      readyStock: "20Kg",
      category: "Produk Retailer",
      namaToko: "Firdaus Store",
      alamat: "Yogyakarta",
      statusPesanan: "20 menit pesanan diproses",
      imageUrl: ['assets/images/retailer/selada_organik.png', 'assets/images/retailer/selada_organik.png'],
      //shopImage: ['assets/images/toko/jagung'],
      harga: 65000,
      shopImage: ['assets/images/retailer/beras.png'],
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg',

      // shop: Shop(
      //   imageUrl: ["https://via.placeholder.com/150"],
      //   namaToko: "Toko pak budi",
      //   // isOnline: isOnline,
      //   alamat: "yogyakarta",
      //   // rating: rating,
      //   // statusPesanan: statusPesanan
      // )
  ),
];