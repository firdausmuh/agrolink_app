import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future<SharedPreferences?> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _tokoController = TextEditingController();

  String _gender = 'Laki-laki';
  String _age = '22 Tahun';

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nama', _nameController.text);
      prefs.setString('phone', _phoneController.text);
      prefs.setString('email', _emailController.text);
      prefs.setString('address', _addressController.text);
      prefs.setString('gender', _gender);
      prefs.setString('age', _age);
      prefs.setString('toko', _tokoController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPrefs(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          SharedPreferences? prefs = snapshot.data;
          _nameController.text = prefs!.getString('nama') ?? '';
          _phoneController.text = prefs.getString('phone') ?? '';
          _emailController.text = prefs.getString('email') ?? '';
          _addressController.text = prefs.getString('address') ?? '';
          _tokoController.text = prefs.getString('toko') ?? '';
          _gender = prefs.getString('gender') ?? 'Laki-laki';
          _age = prefs.getString('age') ?? '22 Tahun';

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leadingWidth: 50,
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Profile Picture Section
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: const AssetImage(
                                  'assets/images/profile/profile2.png'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        prefs.getString('username') ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Form Fields
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Nama Lengkap'),
                            _buildTextField(_nameController),
                            const SizedBox(height: 16),

                            // Gender and Age Row
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel('Jenis Kelamin'),
                                      DropdownButtonFormField<String>(
                                        value: _gender,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _gender = newValue!;
                                          });
                                        },
                                        items: <String>['Laki-laki', 'Perempuan']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.black.withOpacity(0.02),
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.grey[300]!),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.grey[300]!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.blue[400]!),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel('Usia'),
                                      _buildTextField(_age),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            _buildLabel('Email'),
                            _buildTextField(_emailController),
                            const SizedBox(height: 16),

                            _buildLabel('No. Handphone/WhatsApp'),
                            _buildTextField(_phoneController),
                            const SizedBox(height: 16),

                            _buildLabel('Toko'),
                            _buildTextField(_tokoController),
                            const SizedBox(height: 16),

                            _buildLabel('Alamat'),
                            _buildTextField(_addressController, maxLines: 3),
                            const SizedBox(height: 16),



                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _handleSubmit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Update',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Submit Button

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildTextField(dynamic controller, {int maxLines = 1}) {
    return TextFormField(
      controller: controller is TextEditingController ? controller : null,
      initialValue: controller is String ? controller : null,
      maxLines: maxLines,
      style: TextStyle(
        color: Colors.deepPurpleAccent.withOpacity(0.6),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.02),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue[400]!),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _tokoController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
