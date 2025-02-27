import 'package:agrolink/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // To toggle password visibility
  bool _rememberMe = false; // To remember the user

  void _login() async {
    // Validasi jika username atau password kosong
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan password tidak boleh kosong'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return; // Hentikan proses login jika validasi gagal
    }

    // Lanjutkan proses login jika validasi berhasil
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? password = prefs.getString('password');

    if (username != null && password != null) {
      if (username == _usernameController.text && password == _passwordController.text) {
        // Store user data and role in SharedPreferences
        prefs.setBool('isLoggedIn', true);
        String? role = prefs.getString('role');

        // Show success SnackBar based on role
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil login sebagai $role!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to the MainScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login failed: Username or password is incorrect"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed: User not found"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
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
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 20,
                ),
                // Login Text
                const Text(
                  'Login',
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
                const SizedBox(height: 5),

                // Remember me and select button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    const Text('Forgot Password?'),
                  ],
                ),
                const SizedBox(height: 20),
                // Login button
                SizedBox(
                  width: double.infinity, // Make the button full width
                  height: 50.0, // Set height for the button
                  child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .primaryColor, // Green color from theme
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Masuk',
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
                    const Text('Belum punya akun?'),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Register screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: const Text(
                        ' Daftar',
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

