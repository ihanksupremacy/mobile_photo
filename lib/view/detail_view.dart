// Import beberapa pustaka dan kelas yang diperlukan
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controllers/app_controller.dart';

// Deklarasi kelas DetailsView yang merupakan StatelessWidget
class DetailsView extends StatelessWidget {
  // Constructor DetailsView dengan parameter index
  DetailsView({super.key, required this.index});

  // Variabel index untuk menyimpan indeks gambar yang dipilih
  final int index;

  // Membuat instance dari AppController menggunakan Get.find
  final AppController homeController = Get.find<AppController>();

  // Metode build yang akan membangun antarmuka pengguna
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold sebagai kerangka dasar
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Hero(
          // Widget Hero untuk animasi transisi gambar
          tag: homeController
              .photos[index].id!, // Tag untuk mengidentifikasi gambar
          child: CachedNetworkImage(
            // Widget CachedNetworkImage untuk memuat dan menyimpan gambar dari URL
            imageUrl:
                homeController.photos[index].urls!['regular']!, // URL gambar
            imageBuilder: (context, imageProvider) => Stack(
              // Stack untuk menempatkan komponen secara berlapis
              alignment: Alignment.bottomCenter,
              children: [
                // Menampilkan gambar dengan fit cover
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Menambahkan gradient pada gambar
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // Menampilkan tanggal pembuatan gambar
                Positioned(
                  bottom: 30,
                  child: Text(
                    homeController.photos[index].createdAt!
                        .substring(0, 10)
                        .replaceAll("-", " / "),
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Placeholder saat gambar sedang dimuat
            placeholder: (context, url) => Center(
              child: LoadingAnimationWidget.flickr(
                rightDotColor: Colors.black,
                leftDotColor: const Color(0xfffd0079),
                size: 35,
              ),
            ),
            // Widget yang ditampilkan ketika terjadi kesalahan saat memuat gambar
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
