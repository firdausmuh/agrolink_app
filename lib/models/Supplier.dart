class produk_supplier {
  final String title;
  final String description;
  final String readyStock;
  final String category;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_supplier({
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

List<produk_supplier> suppliers = [
  produk_supplier(
    title: "Sayur Bayam",
    description: "Bayam adalah salah satu sayuran hijau yang sangat populer dan kaya akan nutrisi. Bayam dikenal sebagai sumber zat besi yang tinggi, sehingga sering disebut sebagai superfood. Sayur ini berasal dari keluarga Amaranthaceae dan banyak digunakan dalam berbagai masakan di seluruh dunia.",
    readyStock: "50 Buah",
    category: "Produk Supplier",
    imageUrl: ['assets/images/produk_supplier/bayam1.png','assets/images/produk_supplier/bayam2.png',],
    harga: 2000,
    rating: 4.2,
    jumlah: [10, 20, 30, 40, 50, 60],
    satuan: 'gr'
  ),
  produk_supplier(
      title: "Edamame",
      description:
          "Edamame adalah kacang kedelai muda yang masih berada dalam polongnya. Biasanya, edamame direbus atau dikukus dengan sedikit garam untuk menghasilkan rasa yang gurih dan lezat. Edamame sering dijadikan camilan sehat atau tambahan dalam masakan Asia, terutama dalam masakan Jepang dan Korea.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/edamame2.png','assets/images/produk_supplier/edamame1.png',],
      harga: 3000,
      rating: 4.4,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
  produk_supplier(
      title: "Jagung",
      description:
          "Jagung (Zea mays) adalah salah satu tanaman pangan utama di dunia yang berasal dari Amerika Tengah dan Selatan. Tanaman ini termasuk dalam keluarga rumput-rumputan (Poaceae) dan menjadi sumber karbohidrat penting bagi banyak masyarakat. Jagung sering digunakan dalam berbagai bentuk, baik sebagai bahan makanan pokok, camilan, maupun bahan baku industri.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/jagun.png','assets/images/produk_supplier/jagun.png',],
      harga: 4000,
      rating: 4.1,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kw'),
  produk_supplier(
      title: "Labu",
      description:
          "Labu adalah jenis sayuran yang berasal dari keluarga Cucurbitaceae yang memiliki berbagai varietas seperti labu kuning, labu air, dan labu siam. Labu dikenal karena rasanya yang manis alami, tekstur lembut, serta kandungan nutrisi yang tinggi. Labu sering digunakan dalam berbagai hidangan, mulai dari sup, makanan penutup, hingga camilan.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/labu.png','assets/images/produk_supplier/labu.png',],
      harga: 100000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'karung'),
  produk_supplier(
      title: "Terong",
      description:
          "Terong (Solanum melongena) adalah salah satu jenis sayuran yang berasal dari keluarga Solanaceae. Terong memiliki ciri khas dengan kulit yang halus dan berwarna ungu, meskipun ada juga terong berwarna hijau, putih, atau kuning. Terong sering digunakan dalam berbagai masakan, baik itu digoreng, dipanggang, atau dijadikan bahan sup.",
      readyStock: "50 Buah",
      category: "Produk Supplier",
      imageUrl: ['assets/images/produk_supplier/terong.png','assets/images/produk_supplier/terong.png',],
      harga: 1000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'),
];
