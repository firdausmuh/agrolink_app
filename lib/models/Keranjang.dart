class Keranjang {
  final String title;
  final String description;
  final String stok;
  final List<String> imageUrl;
  final double harga;
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
}

List<Keranjang> belanjas = [
  Keranjang(
      title: "Sayur Bayam",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      stok: "50 Biji",
      imageUrl: ['assets/images/produk_supplier/bayam1.png','assets/images/produk_supplier/bayam1.png',],
      harga: 2000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'gr'
  ),
  Keranjang(
      title: "Edamame",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      stok: "50 Biji",
      imageUrl: ['assets/images/produk_supplier/edamame1.png','assets/images/produk_supplier/edamame1.png',],
      harga: 3000,
      rating: 4.4,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
  Keranjang(
      title: "Jagung",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      stok: "50 Biji",
      imageUrl: ['assets/images/produk_supplier/jagun.png','assets/images/produk_supplier/jagun.png',],
      harga: 4000,
      rating: 4.1,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kw'),
  Keranjang(
      title: "Labu",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      stok: "50 Biji",
      imageUrl: ['assets/images/produk_supplier/labu.png','assets/images/produk_supplier/labu.png',],
      harga: 100000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'karung'),
  Keranjang(
      title: "Terong",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      stok: "50 Biji",
      imageUrl: ['assets/images/produk_supplier/terong.png','assets/images/produk_supplier/terong.png',],
      harga: 1000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
];



//
// class Keranjang {
//   final String id; // Tambahan ID unik untuk identifikasi keranjang
//   final String title;
//   final String description;
//   final int stok; // Ubah stok ke tipe integer
//   final List<String> imageUrl;
//   final double harga;
//   final double rating;
//   final int jumlah; // Jumlah menjadi integer untuk mempermudah operasi
//   final String satuan;
//
//   Keranjang({
//     required this.id,
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
// // Contoh data keranjang
// List<Keranjang> belanjas = [
//   Keranjang(
//     id: "1",
//     title: "Sayur Bayam",
//     description: "Bayam segar yang kaya akan nutrisi.",
//     stok: 50,
//     imageUrl: [
//       'assets/images/produk_supplier/bayam1.png',
//       'assets/images/produk_supplier/bayam2.png',
//     ],
//     harga: 2000,
//     rating: 4.2,
//     jumlah: 1,
//     satuan: 'gr',
//   ),
//   Keranjang(
//     id: "2",
//     title: "Edamame",
//     description: "Kacang edamame segar dan bergizi.",
//     stok: 50,
//     imageUrl: [
//       'assets/images/produk_supplier/edamame1.png',
//       'assets/images/produk_supplier/edamame2.png',
//     ],
//     harga: 3000,
//     rating: 4.4,
//     jumlah: 1,
//     satuan: 'kg',
//   ),
//   // Tambahkan item lainnya...
// ];
