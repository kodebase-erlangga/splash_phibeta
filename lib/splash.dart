import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _shrink = false;
  bool _fadeOut =
      false; // Variabel untuk memicu perubahan warna menjadi transparan

  @override
  void initState() {
    super.initState();

    // Animasi menyusut dimulai setelah 2400 milidetik
    Future.delayed(const Duration(milliseconds: 2400), () {
      setState(() {
        _shrink = true;
      });
    });

    // Setelah animasi mengecil selesai, buat warna transparan
    Future.delayed(const Duration(milliseconds: 2800), () {
      setState(() {
        _fadeOut = true;
      });
    });

    // Navigasi ke halaman berikutnya setelah 5400 milidetik
    Future.delayed(const Duration(milliseconds: 5400), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Rasio 2.5:1
    double targetWidth = screenWidth * 0.3; // Target width ketika shrink
    double targetHeight = targetWidth / 2.5; // Tinggi mengikuti rasio 2.5:1

    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang putih
          Container(
            color: Colors.white,
          ),
          // Overlay merah dengan animasi menyusut
          Center(
            child: AnimatedContainer(
              duration:
                  const Duration(milliseconds: 400), // Durasi animasi ukuran
              width: _shrink ? targetWidth : screenWidth,
              height: _shrink ? targetHeight : screenHeight,
              decoration: BoxDecoration(
                color: _fadeOut
                    ? Colors
                        .transparent // Setelah shrink, ubah warna menjadi transparan
                    : const Color(
                        0xFFED1B24), // Warna merah saat animasi masih berjalan
                borderRadius:
                    _shrink ? BorderRadius.circular(1000) : BorderRadius.zero,
              ),
            ),
          ),
          // GIF di tengah
          Center(
            child: Image.asset(
              'assets/Images/phibeta.gif',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
