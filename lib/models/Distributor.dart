class produk_distributor {
  final String title;
  final String description;
  final String readyStock;
  final List<String> imageUrl;
  final double harga;
  final double rating;
  final List<double> jumlah;
  final String satuan;

  produk_distributor({
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

List<produk_distributor> distributors = [
  produk_distributor(
      title: "Bumbu Kari Ayam",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Kg",
      imageUrl: ['assets/images/distributor/bumbu_kari.png', 'assets/images/distributor/bumbu_kari.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
  produk_distributor(
      title: "Pakan Ayam",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Pcs",
      imageUrl: ['assets/images/distributor/pakan_ayam.png', 'assets/images/distributor/pakan_ayam.png'],
      harga: 15000,
      rating: 4.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'pcs'
  ),
  produk_distributor(
      title: "Pupuk Organik",
      description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis quam consequuntur nulla? Repellat nihil quo deleniti doloremque consequuntur id pariatur?",
      readyStock: "20Kg",
      imageUrl: ['assets/images/distributor/pupuk_organik.png', 'assets/images/distributor/pupuk_organik.png'],
      harga: 65000,
      rating: 3.2,
      jumlah: [10, 20, 30, 40, 50, 60],
      satuan: 'kg'
  ),
];