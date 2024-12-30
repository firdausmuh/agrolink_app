import 'package:agrolink/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:agrolink/models/Retailer.dart';
import 'package:intl/intl.dart';

import '../keranjang/keranjang_screen.dart';


class DetailRetailerScreen extends StatefulWidget {
  final Shop shops;
  final produk_retailer retailer;
  const DetailRetailerScreen({super.key, required this.shops, required this.retailer});

  @override
  State<DetailRetailerScreen> createState() => _DetailProdukRetailerScreenState();
}


class _DetailProdukRetailerScreenState extends State<DetailRetailerScreen> {
  int selectedIndext = 1;

  String formatCurrency(double value) {
    final formatter =
        NumberFormat("#,##0", "id_ID"); //Locale for Indonesian formating
    return formatter.format(value);
  }
  @override
  Widget build(BuildContext context) {
    print(widget.retailer.jumlah.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.retailer.title,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.retailer.imageUrl.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(
                              widget.retailer.imageUrl[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).width,
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(
                                widget.shops.imageUrl[index],
                                fit: BoxFit.cover,
                            ),
                          );
                        }
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text(
                                    widget.shops.namaToko,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 20),
                                  )
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Flexible(
                          //       child: Text(
                          //         widget.shops.isOnline as String,
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         style: const TextStyle(
                          //             fontWeight: FontWeight.w700, fontSize: 24),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 8,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.shops.alamat,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange.withOpacity(0.8),
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                '4.9',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.orange.withOpacity(0.8),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // Text(
                              //   widget.shops.statusPesanan,
                              //   style: TextStyle(
                              //       color: Colors.orange.withOpacity(0.8),
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.w700),
                              // )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                        ],
                      ),
                  ),
                  const SizedBox(height: 8,),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.retailer.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                            ),
                            Text(
                              'Rp ' +
                                  formatCurrency(widget.retailer.harga)
                                      .toString(),
                              style: const TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.withOpacity(0.8),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '4.8',
                              style: TextStyle(
                                  color: Colors.orange.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Select size',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 44,
                          child: ListView.builder(
                              itemCount: widget.retailer.jumlah.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final bool isSelected = selectedIndext == index;

                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => {
                                        setState(() {
                                          selectedIndext = index;
                                        })
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? const Color(0xFFD3B398)
                                                : Colors.black.withOpacity(0.1),
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Text(
                                          '${widget.retailer.jumlah[index]} ${widget.retailer.satuan}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black
                                                  .withOpacity(0.3)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.retailer.description,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 24,
                        color: Colors.white,
                      )
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KeranjangScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Add to cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}