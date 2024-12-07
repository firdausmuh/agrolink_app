import 'package:agrolink/models/InformasiData.dart';
import 'package:agrolink/screens/informasi/detail_informasi_screen.dart';
import 'package:flutter/material.dart';
import '../../components/informasi/informasi_card.dart';
import '../../components/search_bar.dart';

class InformasiScreen extends StatefulWidget {
  const InformasiScreen({super.key});

  @override
  State<InformasiScreen> createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  final List<Color> _warnaTemaInformasi = [
    const Color(0xFF2ECC71),
    const Color(0xFF2DBAB1),
    const Color(0xFF8A7E0D),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Informasi',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBarWithController(
              hintText: 'Cari Informasi Lainnya',
              onSearch: (query) {
                // Handle search
                print('Searching for: $query');
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: cardDataList.asMap().entries.map((entry) {
                        int index = entry.key;
                        var data = entry.value;

                        return InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailInformasiScreen(
                                          informasiData: data,
                                        )))
                          },
                          radius: 20,
                          child: Column(
                            children: [
                              InformasiCard(
                                warnaTombol: _warnaTemaInformasi[index % 3],
                                informasiData: data,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
