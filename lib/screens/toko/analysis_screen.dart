import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class AnalysisScreen extends StatefulWidget {
  AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  DateTime selectedDate = DateTime.now();
  List<Map<String, String>> salesData = [
    {
      'Nama Produk': 'Sayur bayam',
      'No Invoice': 'IDR1001A',
      'Tanggal Pembayaran': '23-01-2025',
      'Kurir': 'Ninja Express',
      'Harga': 'Rp.20000',
      'Pembeli': 'nadila',
      'Alamat': 'bogor',
      'No Resi': 'GK-17-654321789',
    },
    {
      'Nama Produk': 'Sayur kankung',
      'No Invoice': 'IDR1002B',
      'Tanggal Pembayaran': '22-01-2025',
      'Kurir': 'JNE',
      'Harga': 'Rp.20000',
      'Pembeli': 'nadila',
      'Alamat': 'bogor',
      'No Resi': 'GK-16-789123456',
    },
    {
      'Nama Produk': 'Sayur Wortel',
      'No Invoice': 'IDR1003C',
      'Tanggal Pembayaran': '23-01-2025',
      'Kurir': 'J&T Express',
      'Harga': 'Rp.2000',
      'Pembeli': 'nadila',
      'Alamat': 'bogor',
      'No Resi': 'GK-14-456789123',
    },
    {
      'Nama Produk': 'Basreng',
      'No Invoice': 'IDR1005E',
      'Tanggal Pembayaran': '23-01-2025',
      'Kurir': 'J&T Express',
      'Harga': 'Rp.2000',
      'Pembeli': 'nadila',
      'Alamat': 'bogor',
      'No Resi': 'GK-13-987654321',
    },
    {
      'Nama Produk': 'Sabun herba',
      'No Invoice': 'IDR1008H',
      'Tanggal Pembayaran': '23-01-2025',
      'Kurir': 'JNE',
      'Harga': 'Rp.2000',
      'Pembeli': 'nadila',
      'Alamat': 'bogor',
      'No Resi': 'GK-11-556874536',
    },
  ];

  List<Map<String, String>> get filteredSalesData {
    // Filter data berdasarkan tanggal yang dipilih
    return salesData.where((data) {
      DateTime paymentDate = DateFormat('dd-MM-yyyy').parse(data['Tanggal Pembayaran']!);
      return paymentDate.isAtSameMomentAs(selectedDate);
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _generatePDF() async {
    final pdf = pw.Document();

    final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                "Laporan Penjualan",
                style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Firdaus Store",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.green,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                "Tanggal Laporan: ${dateFormat.format(selectedDate)}",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 13,
                  color: PdfColors.grey600,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: [
                  'Nama Produk',
                  'No Invoice',
                  'Tanggal Pembayaran',
                  'Kurir',
                  'Harga',
                  'Pembeli',
                  'Alamat',
                  'No Resi',
                ],
                data: filteredSalesData.map((data) => [
                  data['Nama Produk']!,
                  data['No Invoice']!,
                  data['Tanggal Pembayaran']!,
                  data['Kurir']!,
                  data['Harga']!,
                  data['Pembeli']!,
                  data['Alamat']!,
                  data['No Resi']!,
                ]).toList(),
                border: pw.TableBorder.all(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
                cellHeight: 30,
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.centerLeft,
                  2: pw.Alignment.centerLeft,
                  3: pw.Alignment.centerLeft,
                  4: pw.Alignment.centerLeft,
                  5: pw.Alignment.centerLeft,
                  6: pw.Alignment.centerLeft,
                  7: pw.Alignment.centerLeft,
                },
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/laporan_penjualan_${dateFormat.format(selectedDate)}.pdf');
    await file.writeAsBytes(await pdf.save());

    OpenFile.open(file.path);
  }



  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Laporan Penjualan",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cek ringkasan penjualan jadi mudah dengan laporan penjualan",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Cari tanggal penjualan",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 90),
                TextButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today, size: 15, color: Colors.red),
                  label: Text("Pilih Tanggal", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Firdaus Store",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Tanggal Laporan: ${dateFormat.format(selectedDate)}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.grey[600]
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 10,
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  columns: const [
                    DataColumn(label: Text('Nama Produk')),
                    DataColumn(label: Text('No Invoice')),
                    DataColumn(label: Text('Tanggal Pembayaran')),
                    DataColumn(label: Text('Kurir')),
                    DataColumn(label: Text('Harga')),
                    DataColumn(label: Text('Pembeli')),
                    DataColumn(label: Text('Alamat')),
                    DataColumn(label: Text('No Resi')),
                  ],
                  rows: filteredSalesData.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(data['Nama Produk']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['No Invoice']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['Tanggal Pembayaran']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['Kurir']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['Harga']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['Pembeli']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['Alamat']!),
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data['No Resi']!),
                          onTap: () {},
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: _generatePDF,
              label: Text("Download Laporan", style: TextStyle(fontSize: 12)),
              icon: const Icon(Icons.download, size: 15, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

