import 'package:agrolink/screens/pembayaran/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart'; // Import the intl package
import '../../models/ShippingMethod.dart'; // Pastikan untuk mengimpor kelas ShippingMethod

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'COD';
  bool showNoteField = false;
  int totalHarga = 0;
  int shippingCost = 0;
  int protectionFee = 0;
  bool isProtectionSelected = false;
  String selectedAddress = 'Terbansari gank v No.106, RT.04/RW.01, Terban, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta';
  String? selectedShippingMethod;
  bool isExpanded = false; // Menyimpan status apakah ExpansionTile terbuka atau tidak

  List<int> hargaItem = [25000];
  List<int> jumlahItem = [1];

  // Data ongkir
  List<ShippingMethod> shippingMethods = [
    ShippingMethod(agent: 'Ninja Express', serviceType: 'Standard', estimatedTime: '1 - 2 Hari', cost: 'Rp. 9.000'),
    ShippingMethod(agent: 'J&T', serviceType: 'Express', estimatedTime: '3 - 6 Hari', cost: 'Rp. 8.000'),
    ShippingMethod(agent: 'JNE', serviceType: 'CTC', estimatedTime: '1 - 2 Hari', cost: 'Rp. 10.000'),
  ];

  void updateTotalHarga() {
    setState(() {
      totalHarga = 0;
      for (int i = 0; i < hargaItem.length; i++) {
        totalHarga += hargaItem[i] * jumlahItem[i];
      }
      totalHarga += shippingCost + protectionFee;
    });
  }

  Future<void> _openGoogleMaps() async {
    final LatLng initialPosition = LatLng(-7.797068, 110.370529); // Initial position (Yogyakarta)

    final LatLng? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(initialPosition: initialPosition),
      ),
    );

    if (selectedLocation != null) {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        selectedLocation.latitude,
        selectedLocation.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks.first;
        setState(() {
          selectedAddress = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.postalCode}, ${placemark.country}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    updateTotalHarga();
    final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Checkout Screen',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alamat Pengiriman kamu',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: _openGoogleMaps,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Kos Belakang Batik Canting Mas',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selectedAddress,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row untuk Gambar Produk dan Informasi Produk
                    Row(
                      children: [
                        // Gambar Produk
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/distributor/sabun_herba.png'), // Ganti sesuai aset Anda
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Detail Produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sabun Herba Bidara',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Jenis : Produk Distributor',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Dibeli : 1 Barang',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Total : Rp25.000',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.security, color: Colors.green, size: 18,),
                            const SizedBox(width: 4),
                            const Text(
                              'Proteksi Produk Rusak',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 110),
                            Text(
                              currencyFormatter.format(3000),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isProtectionSelected = !isProtectionSelected;
                              protectionFee = isProtectionSelected ? 3000 : 0;
                            });
                          },
                          child: Container(
                            width: 20, // Adjusted width for better visibility
                            height: 20, // Adjusted height for better visibility
                            decoration: BoxDecoration(
                              color: isProtectionSelected ? Colors.green : Colors.white,
                              border: Border.all(
                                color: isProtectionSelected ? Colors.green : Colors.grey,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: isProtectionSelected
                                  ? Icon(
                                Icons.check, // Checkmark icon
                                color: Colors.white, // Color of the icon
                                size: 10, // Size of the icon
                              )
                                  : null, // No icon when not selected
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey), // Garis border abu-abu
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Pilih Metode Pengiriman',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.directions_car, size: 18),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded; // Toggle status ekspansi
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // ExpansionTile untuk menampilkan daftar pengiriman
              if (isExpanded) // Hanya tampilkan jika isExpanded true
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shippingMethods.length,
                  itemBuilder: (context, index) {
                    final method = shippingMethods[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/shipping/${method.agent.toLowerCase().replaceAll(' ', '_')}.png', // Pastikan nama file sesuai
                          width: 40,
                          height: 40,
                        ),
                        title: Text(method.agent),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jenis Layanan: ${method.serviceType}'),
                            Text('Estimasi Waktu: ${method.estimatedTime}'),
                            Text('Biaya: ${method.cost}'),
                          ],
                        ),
                        trailing: Radio<String>(
                          value: method.agent,
                          groupValue: selectedShippingMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedShippingMethod = value;
                              shippingCost = int.parse(method.cost.replaceAll(RegExp(r'[^0-9]'), ''));
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),

              // Metode Pembayaran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    'Lihat semua',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Image.asset(
                  'assets/images/toko/icon_bca.png',
                  width: 40,
                  height: 40,
                ),
                title: const Text('BCA Virtual Account'),
                trailing: Radio<String>(
                  value: 'BCA Virtual Account',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/toko/icon_cod.png',
                  width: 35,
                  height: 35,
                ),
                title: const Text('COD (Bayar di tempat)'),
                trailing: Radio<String>(
                  value: 'COD (Bayar di tempat)',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1, height:  1,),
              ListTile(
                leading: const Icon(Icons.note_alt, color: Colors.grey, size: 20),
                title: const Text('Kasih catatan'),
                trailing: IconButton(
                  icon: Icon(
                    showNoteField ? Icons.arrow_drop_down : Icons.arrow_right,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      showNoteField = !showNoteField;
                    });
                  },
                ),
              ),
              if (showNoteField)
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pastikan tidak ada data pribadi yang tercantum',
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              const Divider(color: Colors.grey, thickness: 1, height: 1,),
              const SizedBox(height: 10),

              // Ringkasan Transaksi
              const Text(
                'Cek ringkasan transaksimu, yuk',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 10),
              _buildSummaryRow('Total Harga (1 barang)', currencyFormatter.format(25000)),
              _buildSummaryRow('Total Ongkos Kirim', currencyFormatter.format(shippingCost)),
              _buildSummaryRow('Total Biaya Proteksi', currencyFormatter.format(protectionFee)),
              const Divider(color: Colors.grey, thickness: 1),
              _buildSummaryRow(
                'Total Tagihan',
                currencyFormatter.format(totalHarga),
                isTotal: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensures the column takes minimum space
          children: [
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color(0xFF199D52),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     minimumSize: const Size(double.infinity, 50),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const PaymentScreen(),
            //       ),
            //     );
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
            //       SizedBox(width: 8),
            //       Text(
            //         'Bayar Sekarang',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF199D52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(totalHarga: totalHarga),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Bayar Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Add some space between the button and the text
            const Text(
              "Dengan melanjutkan Pembayaran kamu menyetujui biaya Ongkos Kirim & Proteksi",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                fontSize: 12, // Font size for the text
                color: Colors.grey, // Color of the text
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  final LatLng initialPosition;

  const MapScreen({required this.initialPosition, super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Alamat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_selectedLocation != null) {
                Navigator.pop(context, _selectedLocation);
              }
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialPosition,
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        onTap: (LatLng latLng) {
          setState(() {
            _selectedLocation = latLng;
          });
        },
        markers: _selectedLocation != null
            ? {
          Marker(
            markerId: const MarkerId('selectedLocation'),
            position: _selectedLocation!,
          ),
        }
            : {},
      ),
    );
  }
}
