class produk_produsen {
  final String title;
  final String description;
  final String readyStock;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_produsen({
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

List<produk_produsen> produsens = [
  produk_produsen(
      title: "Sayur Kangkung",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Pack",
      imageUrl: ['assets/images/produsen/kankung.png', 'assets/images/produsen/kankung.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_produsen(
      title: "Sayur Sawi Jadi",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Pcs",
      imageUrl: ['assets/images/produsen/sawi.png', 'assets/images/produsen/sawi.png'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_produsen(
      title: "Buah Naga Segar",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Kg",
      imageUrl: ['assets/images/produsen/buah_naga.png', 'assets/images/produsen/buah_naga.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];