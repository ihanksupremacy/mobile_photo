// Import pustaka Dio untuk melakukan permintaan HTTP
import 'package:dio/dio.dart';

// Deklarasi kelas DioService
class DioService {
  // Konstruktor privat untuk memastikan kelas ini tidak dapat diinisialisasi secara langsung
  DioService._();

  /// Get Method
  // Metode statis untuk melakukan permintaan HTTP dengan metode GET
  static Future<dynamic> getURL(String url) async {
    // Buat objek Dio
    Dio dio = Dio();

    // Setel header 'content-Type' ke 'application/json'
    dio.options.headers['content-Type'] = 'application/json';

    // Lakukan permintaan GET dengan menggunakan objek Dio
    return await dio
        .get(
      url,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    )
        .then((response) {
      // Kembalikan respons dari permintaan
      return response;
    });
  }
}
