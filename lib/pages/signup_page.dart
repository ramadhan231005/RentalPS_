import 'package:flutter/material.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedRole = 'user'; // 'user' or 'admin'

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon isi semua field')),
      );
      return;
    }

    String roleText = _selectedRole == 'user' ? 'Penyewa (User)' : 'Pemilik Rental (Admin)';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Akun berhasil dibuat!\nNama: $name\nEmail: $email\nPeran: $roleText',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Logo and Branding
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF1E88E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videogame_asset, color: Colors.white, size: 24),
                    const SizedBox(width: 8),
                    const Text(
                      'RentPlay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Heading
              const Text(
                'Buat Akun',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Text(
                'Pilih peran Anda dan isi formulir untuk memulai.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7F8C8D),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              // Full Name Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Lengkap',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'John Doe',
                      hintStyle: const TextStyle(
                        color: Color(0xFFBDC3C7),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFF1E88E5),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Email Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'anda@email.com',
                      hintStyle: const TextStyle(
                        color: Color(0xFFBDC3C7),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFF1E88E5),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Password Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kata Sandi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Masukkan kata sandi Anda',
                      hintStyle: const TextStyle(
                        color: Color(0xFFBDC3C7),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xFF1E88E5),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFFBDC3C7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Role Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar sebagai',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // User Role
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRole = 'user';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedRole == 'user'
                                    ? Color(0xFF1E88E5)
                                    : Color(0xFFBDC3C7),
                                width: _selectedRole == 'user' ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'user',
                                  groupValue: _selectedRole,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRole = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF1E88E5),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Penyewa (User)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF2C3E50),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Admin Role
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRole = 'admin';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedRole == 'admin'
                                    ? Color(0xFF1E88E5)
                                    : Color(0xFFBDC3C7),
                                width: _selectedRole == 'admin' ? 2 : 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'admin',
                                  groupValue: _selectedRole,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRole = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF1E88E5),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Pemilik Rental (Admin)',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF2C3E50),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleSignup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E88E5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7F8C8D),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1E88E5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
