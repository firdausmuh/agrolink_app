class Shop {
  final List<String> imageUrl;
  final String namaToko;
  // final bool isOnline;
  final String alamat;
  // final double rating;
  // final String statusPesanan;

  Shop({
    required this.imageUrl,
    required this.namaToko,
    // required this.isOnline,
    required this.alamat,
    // required this.rating,
    // required this.statusPesanan,
  });
}

List<Shop> shops = [
  Shop(
    namaToko: 'Lydias Store',
    imageUrl: ['assets/images/produk_supplier/bayam.png'],
    // isOnline: true,
    alamat: "Yogyakarta",
    // rating: 3.1,
    // statusPesanan: "5",
  ),
];