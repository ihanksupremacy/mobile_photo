// Import beberapa pustaka dan kelas yang diperlukan
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Deklarasi kelas MyAppBar yang merupakan StatelessWidget
class MyAppBar extends StatelessWidget {
  // Constructor MyAppBar
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  // Metode build untuk membangun antarmuka pengguna
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar menggunakan MediaQuery
    var size = MediaQuery.of(context).size;

    // Mengembalikan widget Container yang berisi elemen-elemen antarmuka pengguna
    return Expanded(
      flex: 3,
      child: Container(
        width: size.width,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          // Menambahkan gambar latar belakang dengan efek gelap
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
            image: const AssetImage('assets/1.jpg'), // Gambar dari asset
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                // Menampilkan teks di atas gambar
                Text(
                  "Choose your best\n picture today",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
