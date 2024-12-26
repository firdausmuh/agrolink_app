// import 'package:flutter/material.dart';
//
// class RetailerCard extends StatelessWidget {
//   final String name;
//   final String description;
//   final String readyStock;
//   final String shopName;
//   final String shopImage;
//   final String category;
//   final double price;
//   final String imageUrl;
//   final VoidCallback onAddPressed;
//
//   const RetailerCard({
//     Key? key,
//     required this.name,
//     required this.description,
//     required this.shopName,
//     required this.shopImage,
//     required this.readyStock,
//     required this.category,
//     required this.price,
//     required this.imageUrl,
//     required this.onAddPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//             //informasi Toko
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Flexible(
//                       fit: FlexFit.loose,
//                       child: Text(
//                         shopImage,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                   ),
//                   const SizedBox(width: 10),
//                   const Icon(Icons.shopping_cart),
//                   // ClipRRect(
//                   //   borderRadius: BorderRadius.circular(5),
//                   //   child: Image.network(
//                   //     shopImage,
//                   //     width: 50,
//                   //     height: 50,
//                   //     fit: BoxFit.cover,
//                   //     errorBuilder: (context, error, stackTrace) {
//                   //       return const Icon(Icons.image, size: 50);
//                   //     }
//                   //   ),
//                   // ),
//                   const SizedBox(height: 16),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //gambar produk
//                       Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             imageUrl,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       // Detail Produk
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               name,
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               description,
//                               maxLines: 3,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Ready Stock: ${readyStock.toString()}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[800],
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Kategory: ${category.toString()}',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Rp. ${price.toStringAsFixed(0)}',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//         ),
//       ),
//
//       // child: Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: Row(
//       //     crossAxisAlignment: CrossAxisAlignment.center,
//       //     children: [
//       //       Row(
//       //         mainAxisSize: MainAxisSize.min,
//       //         children: [
//       //           Flexible(
//       //               fit: FlexFit.loose,
//       //               child: ClipRRect(
//       //                 borderRadius: BorderRadius.circular(5),
//       //                 child: Image.network(
//       //                   shopImage,
//       //                   fit: BoxFit.cover,
//       //                   errorBuilder: (context, error, stackTrace) {
//       //                     return const Icon(Icons.image, size: 50);
//       //                   },
//       //                 ),
//       //             ),
//       //           ),
//       //           const SizedBox(width: 12),
//       //           Expanded(
//       //             child: Text(
//       //               shopName,
//       //               style: const TextStyle(
//       //                 fontSize: 18,
//       //                 fontWeight: FontWeight.bold,
//       //               ),
//       //             ),
//       //           ),
//       //         ],
//       //       ),
//       //       const SizedBox(height: 16),
//       //       // Shop Image
//       //       // Container(
//       //       //   width: 50,
//       //       //   height: 50,
//       //       //   decoration: BoxDecoration(
//       //       //     borderRadius: BorderRadius.circular(5),
//       //       //   ),
//       //       //   child: ClipRRect(
//       //       //     borderRadius: BorderRadius.circular(5),
//       //       //     child: Image.network( // Gunakan NetworkImage jika gambar berasal dari URL
//       //       //       shopImage,
//       //       //       fit: BoxFit.cover,
//       //       //       errorBuilder: (context, error, stackTrace) {
//       //       //         return const Icon(Icons.image, size: 50); // Placeholder jika gambar gagal dimuat
//       //       //       },
//       //       //     ),
//       //       //   ),
//       //       // ),
//       //
//       //       // const SizedBox(width: 12),
//       //       // Expanded(
//       //       //     child: Column(
//       //       //       crossAxisAlignment: CrossAxisAlignment.start,
//       //       //       children: [
//       //       //         // Nama Toko
//       //       //         Text(
//       //       //           shopName,
//       //       //           style: const TextStyle(
//       //       //             fontSize: 18,
//       //       //             fontWeight: FontWeight.bold
//       //       //           ),
//       //       //         )
//       //       //       ],
//       //       //     )
//       //       // ),
//       //       // Product Image
//       //       Container(
//       //         width: 100,
//       //         height: 100,
//       //         decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(10),
//       //         ),
//       //         child: ClipRRect(
//       //           borderRadius: BorderRadius.circular(10),
//       //           child: Image.asset(
//       //             imageUrl,
//       //             fit: BoxFit.cover,
//       //           ),
//       //         ),
//       //       ),
//       //       const SizedBox(width: 16),
//       //
//       //       // Product Details
//       //       Expanded(
//       //         child: Column(
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             Text(
//       //               name,
//       //               style: const TextStyle(
//       //                 fontSize: 18,
//       //                 fontWeight: FontWeight.bold,
//       //               ),
//       //             ),
//       //             const SizedBox(height: 4),
//       //             Text(
//       //               description,
//       //               maxLines: 3,
//       //               overflow: TextOverflow.ellipsis,
//       //               style: TextStyle(
//       //                 fontSize: 14,
//       //                 color: Colors.grey[600],
//       //               ),
//       //             ),
//       //             const SizedBox(height: 8,),
//       //             Text(
//       //               'Ready Stock: ${readyStock.toString()}',
//       //               maxLines: 1,
//       //               overflow: TextOverflow.ellipsis,
//       //               style: TextStyle(
//       //                 fontSize: 14,
//       //                 color: Colors.grey[800],
//       //               ),
//       //             ),
//       //             const SizedBox(height: 8,),
//       //             Text(
//       //               'Kategory: ${category.toString()}',
//       //               maxLines: 1,
//       //               overflow: TextOverflow.ellipsis,
//       //               style: TextStyle(
//       //                 fontSize: 14,
//       //                 color: Colors.black,
//       //               ),
//       //             ),
//       //             const SizedBox(height: 8),
//       //             Row(
//       //               mainAxisSize: MainAxisSize.min,
//       //               children: [
//       //                 Text(
//       //                   'Rp. ${price.toStringAsFixed(0)}',
//       //                   style: const TextStyle(
//       //                     fontSize: 20,
//       //                     fontWeight: FontWeight.bold,
//       //                     color: Colors.green,
//       //                   ),
//       //                 ),
//       //                 Container(
//       //                   decoration: BoxDecoration(
//       //                     color: Colors.green,
//       //                     borderRadius: BorderRadius.circular(8),
//       //                   ),
//       //                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       //                   child: const Center(
//       //                     child: Text(
//       //                         'Beli Sekarang',
//       //                         style: TextStyle(
//       //                           color: Colors.white,
//       //                           fontSize: 10,
//       //                           fontWeight: FontWeight.bold,
//       //                         )
//       //
//       //                     ),
//       //                   ),
//       //                 )
//       //                 // IconButton(
//       //                 //   onPressed: onAddPressed,
//       //                 //   icon: Container(
//       //                 //     padding: const EdgeInsets.all(4),
//       //                 //     decoration: const BoxDecoration(
//       //                 //       color: Colors.red,
//       //                 //       shape: BoxShape.circle,
//       //                 //     ),
//       //                 //     child: const Icon(
//       //                 //       Icons.add,
//       //                 //       color: Colors.white,
//       //                 //       size: 20,
//       //                 //     ),
//       //                 //   ),
//       //                 // ),
//       //               ],
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ],
//     //   //   ),
//     //   ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class RetailerCard extends StatelessWidget {
  final String name;
  final String description;
  final String readyStock;
  final String shopName;
  final String shopImage;
  final String category;
  final double price;
  final String imageUrl;
  final VoidCallback onAddPressed;

  const RetailerCard({
    Key? key,
    required this.name,
    required this.description,
    required this.shopName,
    required this.shopImage,
    required this.readyStock,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi Toko

            const SizedBox(height: 16),
            // Detail Produk
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Produk
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image, size: 50);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Detail Produk
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        'Ready Stock: ${readyStock.toString()}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        'Kategory: ${category.toString()}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Rp. ${price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 21),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            child: const Center(
                              child: Text(
                                  'Beli Sekarang',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )

                              ),
                            ),
                          )
                          // IconButton(
                          //   onPressed: onAddPressed,
                          //   icon: Container(
                          //     padding: const EdgeInsets.all(4),
                          //     decoration: const BoxDecoration(
                          //       color: Colors.red,
                          //       shape: BoxShape.circle,
                          //     ),
                          //     child: const Icon(
                          //       Icons.add,
                          //       color: Colors.white,
                          //       size: 20,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
