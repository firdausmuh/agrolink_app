import 'package:agrolink/components/informasi/informasi_card.dart';
import 'package:agrolink/components/layanan_box.dart';
import 'package:agrolink/models/InformasiData.dart';
import 'package:agrolink/screens/informasi/detail_informasi_screen.dart';
import 'package:agrolink/screens/informasi/informasi_screen.dart';
import 'package:agrolink/screens/perawatan_tanaman/perawatan_tanaman_screen.dart';
import 'package:agrolink/screens/produk_supplier/belanja_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Color> _warnaTemaInformasi = [
    const Color(0xFF2ECC71),
    const Color(0xFF2DBAB1),
    const Color(0xFF8A7E0D),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Hey Nadila Azucena',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.waving_hand,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Text('Selamat datang di Agrolink')
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              CircleAvatar(
                radius: 24,
                child: Image.asset('assets/images/profile.png'),
              )
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        // Section iklan
        Row(
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/iklan.png',
              fit: BoxFit.cover,
            )),
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        // Content
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section paket layanan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Produk Pertanian',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Even space between items
                          children: [
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BelanjaScreen()),
                                  )
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/suplier.jpg',
                                    label: 'Produk Suplier'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PerawatanTanamanScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/produsen.jpg',
                                    label: 'Produk Produsen'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const InformasiScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                        'assets/images/layanan/distributor.jpg',
                                    label: 'Produk Distributor'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const InformasiScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                    'assets/images/layanan/retailer.jpg',
                                    label: 'Produk Retailer'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const InformasiScreen()))
                                },
                                child: const LayananBox(
                                    imagePath:
                                    'assets/images/layanan/informasi.png',
                                    label: 'Informasi pertanian'),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                          ],
                        ),
                      ]),
                ),

                const SizedBox(
                  height: 20,
                ),
                // Section terbaru
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Terbaru',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: cardDataList.asMap().entries.map((entry) {
                      int index = entry.key;
                      var data = entry.value;

                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailInformasiScreen(
                                      informasiData: data)))
                        },
                        child: Column(
                          children: [
                            InformasiCard(
                              warnaTombol: _warnaTemaInformasi[index % 3],
                              informasiData: data,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
