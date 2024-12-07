import 'package:agrolink/models/InformasiData.dart';
import 'package:flutter/material.dart';

class DetailInformasiScreen extends StatefulWidget {
  final InformasiData informasiData;
  const DetailInformasiScreen({super.key, required this.informasiData});

  @override
  State<DetailInformasiScreen> createState() => _DetailInformasiScreenState();
}

class _DetailInformasiScreenState extends State<DetailInformasiScreen> {
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
          title: Text(
            widget.informasiData.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.informasiData.imageUrl.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Image.asset(
                        widget.informasiData.imageUrl[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).width - 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.informasiData.title,
                      style:
                          const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.informasiData.tanggal),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Download File',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                            onTap: () => {},
                            child: const CircleAvatar(
                              radius: 12,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  size: 16,
                                  Icons.download,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Ringkasan Informasi',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.informasiData.description),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
