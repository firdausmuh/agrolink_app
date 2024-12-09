class Belanja {
  final String title;
  final String description;
  final String readyStock;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  Belanja({
    required this.title,
    required this.description,
    required this.readyStock,
    required this.imageUrl,
    required this.harga,
    required this.rating,
    required this.jumlah,
    required this.satuan,
  });
}

List<Belanja> belanjas = [
  Belanja(
    title: "Sayur Bayam",
    description:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
    readyStock: "50 Buah",
    imageUrl: ['assets/images/produk_supplier/bayam.png','assets/images/produk_supplier/bayam.png',],
    harga: 2000,
    rating: 4.2,
    jumlah: [10, 20, 30, 40, 50, 60],
    satuan: 'gr'
  ),
  Belanja(
      title: "Edamame",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "50 Buah",
      imageUrl: ['assets/images/produk_supplier/edamame.png','assets/images/produk_supplier/edamame.png',],
      harga: 3000,
      rating: 4.4,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
  Belanja(
      title: "Jagung",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "50 Buah",
      imageUrl: ['assets/images/produk_supplier/jagun.png','assets/images/produk_supplier/jagun.png',],
      harga: 4000,
      rating: 4.1,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kw'),
  Belanja(
      title: "Labu",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "50 Buah",
      imageUrl: ['assets/images/produk_supplier/labu.png','assets/images/produk_supplier/labu.png',],
      harga: 100000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'karung'),
  Belanja(
      title: "Terong",
      description:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "50 Buah",
      imageUrl: ['assets/images/produk_supplier/terong.png','assets/images/produk_supplier/terong.png',],
      harga: 1000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
];
