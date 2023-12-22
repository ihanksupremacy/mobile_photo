// Import pustaka 'dart:developer' untuk utilitas logging dan debugging
import 'dart:developer';

// Import pustaka GetX untuk state management dan fitur-fitur lainnya
import 'package:get/get.dart';

// Import model PhotosModel dari file terpisah
import 'package:mobile_photo/model/photos_model.dart';

// Import layanan DioService dari file terpisah
import 'package:mobile_photo/services/dio_service.dart';

// Deklarasikan kelas AppController yang mengextend dari GetxController
class AppController extends GetxController {
  // RxList untuk menyimpan daftar foto yang dapat di-observe
  RxList<PhotosModel> photos = RxList();

  // RxBool untuk menyimpan status apakah data sedang dimuat atau tidak
  RxBool isLoading = true.obs;

  // RxString untuk menyimpan nilai orderBy yang dapat di-observe
  RxString orderBy = "latest".obs;

  // RxString untuk menyimpan kunci API yang dapat di-observe
  RxString apiKey = "McDO3bwShvw1PEEP_FQx2l3rCntlg8VhoqFQXhPvivs".obs;

  // Variabel selectedIndex untuk menyimpan indeks yang dipilih, di-observe
  var selectedIndex = 0.obs;

  // List orders berisi nilai-nilai urutan yang dapat dipilih
  List<String> orders = [
    "latest",
    "popular",
    "oldest",
    "views",
  ];

  // Metode untuk mengambil data gambar dari API
  getPictureData() async {
    // Set isLoading ke true untuk menunjukkan bahwa data sedang dimuat
    isLoading.value = true;

    // Panggil metode getURL dari DioService untuk mendapatkan respons dari API
    var response = await DioService.getURL(
        "https://api.unsplash.com/photos/?per_page=30&order_by=${orderBy.value}&client_id=$apiKey");

    // Bersihkan list photos sebelum menambahkan data baru
    photos = RxList();

    // Periksa jika respons berhasil (status code 200)
    if (response.statusCode == 200) {
      // Iterasi melalui setiap elemen respons dan tambahkan ke list photos
      response.data.forEach((element) {
        photos.add(PhotosModel.fromJson(element));
      });

      // Set isLoading ke false karena data telah selesai dimuat
      isLoading.value = false;
    }

    // Log status code dari respons
    log(response.statusCode);
  }

  // Metode untuk mengubah nilai orderBy dan memperbarui data
  ordersFunc(String newVal) {
    // Set nilai orderBy dengan nilai baru
    orderBy.value = newVal;

    // Panggil getPictureData untuk memperbarui data sesuai dengan urutan yang dipilih
    getPictureData();
  }

  // Override metode onInit yang dipanggil saat kelas diinisialisasi
  @override
  void onInit() {
    // Panggil getPictureData saat kelas diinisialisasi
    getPictureData();

    // Panggil metode onInit dari kelas induk (GetX)
    super.onInit();
  }
}
