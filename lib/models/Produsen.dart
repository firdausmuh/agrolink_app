class produk_produsen {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_produsen({
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

List<produk_produsen> produsens = [
  produk_produsen(
      title: "Sayur Kangkung",
      description: "Kangkung, yang memiliki nama ilmiah Ipomoea aquatica, adalah salah satu jenis sayuran hijau yang populer di banyak negara Asia, termasuk Indonesia. Kangkung dikenal sebagai sayuran yang tumbuh cepat dan mudah dibudidayakan, terutama di daerah tropis dengan banyak air.",
      readyStock: "20Pack",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/kankung.png', 'assets/images/produsen/kankung.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_produsen(
      title: "Sayur Sawi Jadi",
      description: "Sawi adalah jenis sayuran hijau yang termasuk dalam keluarga Brassicaceae atau kubis-kubisan. Sayuran ini sering digunakan dalam berbagai masakan Asia karena rasanya yang segar dan kandungan gizinya yang tinggi. Di Indonesia, sawi sangat populer dan tersedia dalam beberapa varietas.",
      readyStock: "20Pcs",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/sawi.png', 'assets/images/produsen/sawi.png'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_produsen(
      title: "Buah Naga Segar",
      description: "Buah naga, dikenal juga sebagai pitaya, adalah buah tropis yang berasal dari kaktus genus Hylocereus atau Selenicereus. Buah ini populer karena bentuknya yang unik, rasa manisnya yang menyegarkan, serta manfaat kesehatannya yang beragam.",
      readyStock: "20Kg",
      category: "Produk Produsen",
      imageUrl: ['assets/images/produsen/buah_naga.png', 'assets/images/produsen/buah_naga.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];