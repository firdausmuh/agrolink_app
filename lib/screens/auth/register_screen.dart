import 'package:agrolink/screens/auth/login_screen.dart';
import 'package:agrolink/screens/main_screen.dart';
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



  // void _register() async {
  //   // Simple validation logic for the example
  //   if (_passwordController.text == _checkPasswordController.text) {
  //     // Credentials are valid
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Login Successful!'),
  //         backgroundColor: Colors.green,
  //       ),
  //     );
  //
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('username', _usernameController.text);
  //     prefs.setBool('isLoggedIn', true);
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => MainScreen()),
  //     );
  //   } else {
  //     // Credentials are invalid, show a SnackBar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Password doesn't match"),
  //         backgroundColor: Colors.red, // Set the color of the SnackBar to red
  //         duration:
  //             Duration(seconds: 3), // SnackBar will disappear after 3 seconds
  //       ),
  //     );
  //   }
  // }

  void _register() async {
    String nama = _namaController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _checkPasswordController.text;

    // Validation checks
    if (nama.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields are required!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
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
    await prefs.setBool('isLoggedIn', true);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration successful! Please log in.'),
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
                // Login Text
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
                    // Label style when the field is not focused
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
                    ),
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
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
                    // Label style when the field is not focused
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
                    ),
                    prefixIcon: const Icon(Icons.account_box),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
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
                    // Label style when the field is not focused
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
                    ),
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Username input field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Telephone',
                    // Label style when the field is not focused
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password input field with show/hide functionality
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible, // Hide password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
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
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Check Password input field with show/hide functionality
                TextFormField(
                  controller: _checkPasswordController,
                  obscureText: !_isCheckPasswordVisible, // Hide password
                  decoration: InputDecoration(
                    labelText: 'Re-type Password',
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Set label color when not focused
                    ),
                    // Label style when the field is focused
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context)
                          .primaryColor, // Set label color when focused
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
                        color: Colors.grey, // Set the inactive border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                    // Border when the field is active (focused)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor, // Set the active border color
                        width: 2.0, // Set the border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login button
                SizedBox(
                  width: double.infinity, // Make the button full width
                  height: 50.0, // Set height for the button
                  child: ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .primaryColor, // Green color from theme
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

                // Register text with navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Register screen
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


