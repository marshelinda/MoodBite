import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // MATERI PERTEMUAN 5: GlobalKey untuk validasi status Form
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  // Fungsi Pop-up Dialog Sukses dengan kalimat interaktif pilihanmu
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/logo_moodbite.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Masuk Berhasil!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E35), // Warna Hijau Gelap Figma
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Yey, sukses masuk! Yuk, ceritain perasaan dan energi kamu hari ini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF7E7E7E), // Warna Abu-abu Figma
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF94B4A4,
                    ), // Warna Hijau Sage Figma
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        14,
                      ), // Radius 14 Figma
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          _showSuccessDialog();
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // VARIABEL WARNA BERDASARKAN HASIL INSPECT FIGMA KAMU
    const Color primaryGreen = Color(0xFF94B4A4); // Dari Gambar Figma (#94B4A4)
    const Color darkGreen = Color(0xFF2C3E35); // Dari Gambar Figma (#2C3E35)
    const Color textGrey = Color(0xFF7E7E7E); // Dari Gambar Figma (#7E7E7E)

    return Scaffold(
      backgroundColor: const Color(
        0xFFF9FAFC,
      ), // Warna background putih kebiruan sesuai Figma terbarumu!
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo Maskot Utama MoodBite
                  Center(
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            // Menggunakan Color.fromRGBO agar 100% AMAN dari warning di semua versi Flutter
                            color: const Color.fromRGBO(0, 0, 0, 0.04),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/logo_moodbite.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // TEKS JUDUL UTAMA - PRESISI FIGMA
                  const Text(
                    'MoodBite',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: darkGreen,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // TEKS TAGLINE - PRESISI FIGMA
                  const Text(
                    'Feed Your Mind, Fuel Your Body',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: textGrey),
                  ),
                  const SizedBox(height: 40),

                  // INPUT EMAIL
                  const Text(
                    'Email kamu',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: textGrey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'nama@email.com',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          14,
                        ), // Radius 14 sesuai Figma
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                    ),
                    // VALIDASI EMAIL REFORMASI (MENGGUNAKAN REGEX STANDAR APLIKASI ASLI)
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }

                      // Pola untuk mencocokkan struktur email valid secara utuh
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regExp = RegExp(pattern);

                      if (!regExp.hasMatch(value)) {
                        return 'Format email salah (contoh: nama@email.com)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // INPUT KATA SANDI
                  const Text(
                    'Kata sandi',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: textGrey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          14,
                        ), // Radius 14 sesuai Figma
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: textGrey,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      }
                      if (value.length < 8) {
                        return 'Kata sandi minimal harus 8 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text(
                        'Lupa kata sandi?',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // TOMBOL UTAMA MASUK - PRESISI FIGMA
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          14,
                        ), // Radius 14 dari Figma
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 32),

                  // Footer Daftar Akun
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum punya akun? ',
                        style: TextStyle(color: textGrey, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 13,
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
      ),
    );
  }
}
