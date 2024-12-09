import 'package:flutter/material.dart';
import 'package:agrolink/models/Produsen.dart';
import 'package:intl/intl.dart';


class DetailProdusenScreen extends StatefulWidget {
  final produk_produsen produsen;
  const DetailProdusenScreen({super.key, required this.produsen});

  @override
  State<DetailProdusenScreen> createState() => _DetailProdukProdusenScreenState();
}

class _DetailProdukProdusenScreenState extends State<DetailProdusenScreen> {
  int selectedIndext = 1;

  String formatCurrency(double value) {
    final formatter =
    NumberFormat("#,##0", "id_ID"); //Locale for Indonesian formating
    return formatter.format(value);
  }
  @override
  Widget build(BuildContext context) {
    print(widget.produsen.jumlah.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.produsen.title,
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
                        itemCount: widget.produsen.imageUrl.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(
                              widget.produsen.imageUrl[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.produsen.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                            ),
                            Text(
                              'Rp ' +
                                  formatCurrency(widget.produsen.harga)
                                      .toString(),
                              style: const TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                              itemCount: widget.produsen.jumlah.length,
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
                                          '${widget.produsen.jumlah[index]} ${widget.produsen.satuan}',
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
                                widget.produsen.description,
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
                        // Row(
                        //   children: [
                        //     Flexible(
                        //       child: Text(
                        //         widget.belanja.readyStock,
                        //         style: TextStyle(
                        //             color: Colors.black.withOpacity(0.8),
                        //             fontSize: 16),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => {},
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
                        )),
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