import 'dart:ffi';

import 'package:agrolink/screens/auth/login_screen.dart';
import 'package:agrolink/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _showCustomLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          title: const Center(
            child: Text(
              "Keluar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Set the title color to blue
              ),
            ),
          ),
          content: Text(
            "Apakah kamu yakin ingin keluar?\nTindakan ini akan membawa kamu menuju ke halaman login",
            textAlign: TextAlign.center, // Center-align the content
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600], // Set content color to a grey shade
            ),
          ),
          actionsAlignment: MainAxisAlignment.center, // Center-align the actions
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Batal",
                style: TextStyle(
                  color: Colors.blue, // Set the cancel button color to blue
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Add logout logic here
                _logout(context);
              },
              child: const Text(
                "Keluar",
                style: TextStyle(
                  color: Colors.red, // Set the logout button color to red
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 20),
  //           // Profile Image and Name
  //           Center(
  //             child: _customContainer(
  //               Row(
  //                 children: [
  //                   const CircleAvatar(
  //                     radius: 32,
  //                     child: CircleAvatar(
  //                       radius: 30,
  //                       backgroundImage:
  //                           AssetImage('assets/images/profile1.png'),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   const Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           'Nadila Azucena',
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                         Text(
  //                           'Bergabung pada: 5 Maret 2024',
  //                           style: TextStyle(fontSize: 12, color: Colors.grey),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   InkWell(
  //                     onTap: () => {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const EditProfileScreen()),
  //                       )
  //                     },
  //                     child: const Column(
  //                       children: [
  //                         Icon(
  //                           Icons.edit,
  //                           color: Colors.blue,
  //                           size: 20,
  //                         ),
  //                         SizedBox(
  //                           height: 5,
  //                         ),
  //                         Text(
  //                           'Edit',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           // Informasi Pribadi Section
  //           Container(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text(
  //                   'Informasi Pribadi',
  //                   style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.blue),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 _customContainer(
  //                   SizedBox(
  //                     height: 400,
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         _buildInfoRow(
  //                             Icons.person_outlined, 'Nadila Azucena', false),
  //                         _buildInfoRow(Icons.email_outlined,
  //                             'rencabesar@gmail.com', false),
  //                         _buildInfoRow(
  //                             Icons.phone_outlined, '089532123456', false),
  //                         _buildInfoRow(Icons.store_outlined, 'Toko', false),
  //                         _buildInfoRow(Icons.cake_outlined, '20 Tahun', false),
  //                         _buildInfoRow(Icons.location_on_outlined,
  //                             'Bogor, Indonesia', true),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 InkWell(
  //                   onTap: () => _showCustomLogoutDialog(context),
  //                   child: _customContainer(
  //                     _buildInfoRow(
  //                       Icons.logout,
  //                       'Keluar',
  //                       true,
  //                       textColor: Colors.red,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 50,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false, // Mengatur teks di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Sisanya tetap seperti sebelumnya
              Center(
                child: _customContainer(
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          AssetImage('assets/images/profile1.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhamad Firdaus',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Bergabung pada: 5 Maret 2024',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfileScreen()),
                          )
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Informasi Pribadi Section
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Pribadi',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800]!),
                    ),
                    const SizedBox(height: 20),
                    _customContainer(
                      SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoRow(Icons.person_outlined, 'Muhamad Firdaus', false),
                            _buildInfoRow(Icons.email_outlined, 'mhfrds234@gmail.com', false),
                            _buildInfoRow(Icons.phone_outlined, '089532123456', false),
                            _buildInfoRow(Icons.store_outlined, 'Toko', false),
                            _buildInfoRow(Icons.cake_outlined, '22 Tahun', false),
                            _buildInfoRow(Icons.location_on_outlined, 'Bogor Raya, Indonesia', true),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => _showCustomLogoutDialog(context),
                      child: _customContainer(
                        _buildInfoRow(
                          Icons.logout,
                          'Keluar',
                          true,
                          textColor: Colors.red[900],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _customContainer(Widget widget) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.02),
      ),
      child: widget,
    );
  }

  Widget _buildInfoRow(IconData icon, String text, bool isLast,
      {Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(isLast ? 0 : 0.1)))),
      child: Row(
        children: [
          Icon(icon, size: 24, color: textColor ?? Colors.deepPurpleAccent),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: textColor ?? Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
