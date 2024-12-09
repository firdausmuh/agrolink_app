class produk_retailer {
  final String title;
  final String description;
  final String readyStock;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_retailer({
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

List<produk_retailer> retailers = [
  produk_retailer(
      title: "Beras Premium",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Kg",
      imageUrl: ['assets/images/retailer/beras.png', 'assets/images/retailer/beras.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_retailer(
      title: "Keripik Kentang",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Pcs",
      imageUrl: ['assets/images/retailer/keripik_kentang.png', 'assets/images/retailer/keripik_kentang.png'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_retailer(
      title: "Selada Organik",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Kg",
      imageUrl: ['assets/images/retailer/selada_organik.png', 'assets/images/retailer/selada_organik.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];