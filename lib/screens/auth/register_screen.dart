import 'package:agrolink/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController = TextEditingController();

  bool _isPasswordVisible = false; // To toggle password visibility
  bool _isCheckPasswordVisible = false; // To toggle password visibility
  String _selectedRole = 'Supplier'; // Default value

  void _register() async {
    String nama = _namaController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _checkPasswordController.text;

    // Validation checks
    if (nama.isEmpty ||
        email.isEmpty ||
        username.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap lengkapi data Anda sebelum melanjutkan'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Stop further execution
    }

    if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email format!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords don't match!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Save user data to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama);
    await prefs.setString('email', email);
    await prefs.setString('username', username);
    await prefs.setString('phone', phone);
    await prefs.setString('role', _selectedRole);
    await prefs.setString('password', password); // Store password (not secure)
    await prefs.setBool('isLoggedIn', false);

    // Show success message with selected role
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda telah mendaftar sebagai $_selectedRole'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register Text
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Subtext
                const Text(
                  'Silahkan masukan email dan password anda untuk menjelajahi Agrolink',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),

                // Dropdown for selecting role register
                Row(
                  children: [
                    const Text(
                      'Daftar Sebagai apa?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      value: _selectedRole,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRole = newValue!;
                        });
                        // Show notification when role is selected
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Anda memilih role sebagai $_selectedRole'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      },
                      items: <String>[
                        'Supplier',
                        'Produsen',
                        'Distributor',
                        'Retailer',
                        'Customer'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Nama input field
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Username input field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.account_box),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Email input field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Phone input field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Telephone',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password input field with show/hide functionality
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Check Password input field with show/hide functionality
                TextFormField(
                  controller: _checkPasswordController,
                  obscureText: !_isCheckPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Re-type Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    prefixIcon: const Icon(Icons.lock_reset),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isCheckPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isCheckPasswordVisible = !_isCheckPasswordVisible;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Register button
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login text with navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}