// import 'package:flutter/material.dart';
//
// class PaymentCard extends StatefulWidget {
//   const PaymentCard({super.key});
//
//   @override
//   State<PaymentCard> createState() => _PaymentCardState();
// }
//
// class _PaymentCardState extends State<PaymentCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.access_time,
//                 color: Colors.orange[800],
//                 size: 55,
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Bayar sebelum',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '20 Januari 2025, 23:11',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Nomor Virtual Account',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Image.asset(
//                 'assets/images/toko/icon_bca.png', // Ganti dengan path logo BCA
//                 height: 24,
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             '12345533235',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'Total Tagihan',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Rp. 40.000',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const Divider(
//             height: 32,
//             thickness: 1,
//             color: Colors.grey,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.info,
//                 color: Colors.red[800],
//                 size: 24,
//               ),
//               const SizedBox(width: 8),
//               // const Expanded(
//               //   child: Text(
//               //     'Penting: Transfer virtual account hanya bisa dilakukan dari bank yang kamu pilih.',
//               //     style: TextStyle(
//               //       fontSize: 14,
//               //       color: Colors.grey,
//               //     ),
//               //   ),
//               // ),
//               Expanded(
//                 child: RichText(
//                   text: TextSpan(
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Penting: ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold, // Bold for "Penting"
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Transfer virtual account hanya bisa dilakukan dari ',
//                       ),
//                       TextSpan(
//                         text: 'bank yang kamu pilih.',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold, // Bold for "bank yang kamu pilih"
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.info,
//                 color: Colors.red[800],
//                 size: 24,
//               ),
//               const SizedBox(width: 4),
//               const Expanded(
//                 child: Text(
//                   'Penting: Periksa ulang detail transaksi sebelum melakukan pembayaran.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class PaymentCard extends StatefulWidget {
  final int totalHarga;

  const PaymentCard({required this.totalHarga, super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.access_time,
                color: Colors.orange[800],
                size: 55,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Bayar sebelum',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '20 Januari 2025, 23:11',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Nomor Virtual Account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/toko/icon_bca.png', // Ganti dengan path logo BCA
                height: 24,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '12345533235',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Total Tagihan',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            currencyFormatter.format(widget.totalHarga),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Divider(
            height: 32,
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: Colors.red[800],
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Penting: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for "Penting"
                        ),
                      ),
                      TextSpan(
                        text: 'Transfer virtual account hanya bisa dilakukan dari ',
                      ),
                      TextSpan(
                        text: 'bank yang kamu pilih.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Bold for "bank yang kamu pilih"
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: Colors.red[800],
                size: 24,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'Penting: Periksa ulang detail transaksi sebelum melakukan pembayaran.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

