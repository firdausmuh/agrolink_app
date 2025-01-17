// class Keranjang {
//   final String title;
//   final String description;
//   final String stok;
//   final List<String> imageUrl;
//   final double harga;
//   final double rating;
//   final List<double> jumlah;
//   final String satuan;
//
//   Keranjang({
//     required this.title,
//     required this.description,
//     required this.stok,
//     required this.imageUrl,
//     required this.harga,
//     required this.rating,
//     required this.jumlah,
//     required this.satuan,
//   });
// }
//
// List<Keranjang> belanjas = [
//   Keranjang(
//       title: "Sayur Bayam",
//       description:
//       "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
//       stok: "50 Biji",
//       imageUrl: ['assets/images/produk_supplier/bayam1.png','assets/images/produk_supplier/bayam1.png',],
//       harga: 2000,
//       rating: 4.2,
//       jumlah: [10, 20, 30, 40, 50, 60],
//       satuan: 'gr'
//   ),
//   Keranjang(
//       title: "Edamame",
//       description:
//       "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
//       stok: "50 Biji",
//       imageUrl: ['assets/images/produk_supplier/edamame1.png','assets/images/produk_supplier/edamame1.png',],
//       harga: 3000,
//       rating: 4.4,
//       jumlah: [10, 20, 30, 40, 50, 60],
//       satuan: 'kg'),
//   Keranjang(
//       title: "Jagung",
//       description:
//       "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
//       stok: "50 Biji",
//       imageUrl: ['assets/images/produk_supplier/jagun.png','assets/images/produk_supplier/jagun.png',],
//       harga: 4000,
//       rating: 4.1,
//       jumlah: [10, 20, 30, 40, 50, 60],
//       satuan: 'kw'),
//   Keranjang(
//       title: "Labu",
//       description:
//       "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
//       stok: "50 Biji",
//       imageUrl: ['assets/images/produk_supplier/labu.png','assets/images/produk_supplier/labu.png',],
//       harga: 100000,
//       rating: 4.2,
//       jumlah: [10, 20, 30, 40, 50, 60],
//       satuan: 'karung'),
//   Keranjang(
//       title: "Terong",
//       description:
//       "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
//       stok: "50 Biji",
//       imageUrl: ['assets/images/produk_supplier/terong.png','assets/images/produk_supplier/terong.png',],
//       harga: 1000,
//       rating: 4.2,
//       jumlah: [10, 20, 30, 40, 50, 60],
//       satuan: 'kg'),
// ];
//
//

// models/keranjang.dart
class Keranjang {
  final String title;
  final String description;
  final String stok;
  final List<String> imageUrl;
  final String harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  Keranjang({
    required this.title,
    required this.description,
    required this.stok,
    required this.imageUrl,
    required this.harga,
    required this.rating,
    required this.jumlah,
    required this.satuan,
  });

  // Convert a Keranjang object into a Map object
  Map<String, dynamic> toMap() {
    return {
      '': title,
      'description': description,
      'stok': stok,
      'imageUrl': imageUrl,
      'harga': harga,
      'rating': rating,
      'jumlah': jumlah,
      'satuan': satuan,
    };
  }

  // Extract a Keranjang object from a Map object
  factory Keranjang.fromMap(Map<String, dynamic> map) {
    return Keranjang(
      title: map['title'],
      description: map['description'],
      stok: map['stok'],
      imageUrl: List<String>.from(map['imageUrl']),
      harga: map['harga'],
      rating: map['rating'],
      jumlah: List<double>.from(map['jumlah']),
      satuan: map['satuan'],
    );
  }
}

