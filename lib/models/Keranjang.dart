class Keranjang {
  final String title;
  final String description;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  Keranjang({
    required this.title,
    required this.description,
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
      imageUrl: ['assets/images/belanja/bayam.png','assets/images/belanja/bayam.png',],
      harga: 2000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'gr'
  ),
  Keranjang(
      title: "Edamame",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      imageUrl: ['assets/images/belanja/edamame.png','assets/images/belanja/edamame.png',],
      harga: 3000,
      rating: 4.4,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
  Keranjang(
      title: "Jagung",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      imageUrl: ['assets/images/belanja/jagun.png','assets/images/belanja/jagun.png',],
      harga: 4000,
      rating: 4.1,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kw'),
  Keranjang(
      title: "Labu",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      imageUrl: ['assets/images/belanja/labu.png','assets/images/belanja/labu.png',],
      harga: 100000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'karung'),
  Keranjang(
      title: "Terong",
      description:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      imageUrl: ['assets/images/belanja/terong.png','assets/images/belanja/terong.png',],
      harga: 1000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
];
