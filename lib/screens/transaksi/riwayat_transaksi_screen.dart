import 'package:flutter/material.dart';

class RiwayatTransaksiScreen extends StatelessWidget {
  const RiwayatTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Transaksi',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(
                color: Color(0xFF406A52),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),
              Text('Rp. 40.000', style: TextStyle(
                color: Color(0xFF406A52),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF406A52),

            ), child: Text('Pesan Sekarang', style: TextStyle(color: Colors.white),)),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
