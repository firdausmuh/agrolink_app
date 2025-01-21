import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  AnalysisScreen({Key? key}) : super(key: key);

  final List<double> salesData = [483548, 784710, 894164, 1116200, 1300000, 1500000]; // Data penjualan
  final List<String> years = ['2020', '2021', '2022', '2023', '2024', '2025']; // Tahun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Analisis Penjualan Tahunan",
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
              "Grafik Penjualan Produk Pertanian",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 300, // Mengatur tinggi grafik
              child: CustomPaint(
                painter: BarChartPainter(salesData),
                child: Container(),
              ),
            ),
            const SizedBox(height: 10),
            // Garis dan label tahun
            Column(
              children: [
                const Divider(thickness: 2, color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: years.map((year) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(year, style: const TextStyle(fontSize: 12)),
                  )).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<double> data;

  BarChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final double barWidth = size.width / (data.length * 2);
    final double maxHeight = size.height;

    // Calculate the scale
    double maxY = data.reduce((a, b) => a > b ? a : b);

    // Draw bars and percentages
    for (int i = 0; i < data.length; i++) {
      final double barHeight = (data[i] / maxY) * maxHeight;
      canvas.drawRect(
        Rect.fromLTWH(
          i * 2 * barWidth + barWidth / 2,
          maxHeight - barHeight,
          barWidth,
          barHeight,
        ),
        paint,
      );

      // Calculate percentage
      double percentage = (data[i] / maxY) * 100;

      // Draw percentage text
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${percentage.toStringAsFixed(1)}%',
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          i * 2 * barWidth + barWidth / 2 - textPainter.width / 2,
          maxHeight - barHeight - 20, // Offset above the bar
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
