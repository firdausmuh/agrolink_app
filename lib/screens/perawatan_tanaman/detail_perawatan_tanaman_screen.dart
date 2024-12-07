import 'package:agrolink/models/PerawatanTanaman.dart';
import 'package:flutter/material.dart';

class DetailPerawatanTanamanScreen extends StatefulWidget {
  final PerawatanTanaman perawatanTanaman;
  const DetailPerawatanTanamanScreen(
      {super.key, required this.perawatanTanaman});

  @override
  State<DetailPerawatanTanamanScreen> createState() =>
      _DetailPerawatanTanamanScreenState();
}

class _DetailPerawatanTanamanScreenState
    extends State<DetailPerawatanTanamanScreen> {
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
          widget.perawatanTanaman.title,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.perawatanTanaman.imageUrl.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.asset(
                    widget.perawatanTanaman.imageUrl[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.perawatanTanaman.description),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Step Plant Care',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.perawatanTanaman.description),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
