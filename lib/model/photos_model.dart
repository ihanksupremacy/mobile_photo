// Deklarasi kelas PhotosModel
class PhotosModel {
  // Variabel untuk menyimpan id foto
  String? id;

  // Variabel untuk menyimpan tanggal pembuatan foto
  String? createdAt;

  // Variabel untuk menyimpan warna foto
  String? color;

  // Map untuk menyimpan URL yang terkait dengan foto
  Map<String, dynamic>? urls;

  // Konstruktor PhotosModel dengan parameter opsional
  PhotosModel({this.id, this.createdAt, this.color, this.urls});

  // Konstruktor PhotosModel yang mengambil data dari objek Map
  PhotosModel.fromJson(Map<String, dynamic> json) {
    // Assign nilai dari key 'id' pada objek json ke variabel id
    id = json['id'];

    // Assign nilai dari key 'created_at' pada objek json ke variabel createdAt
    createdAt = json['created_at'];

    // Assign nilai dari key 'color' pada objek json ke variabel color
    color = json['color'];

    // Assign nilai dari key 'urls' pada objek json ke variabel urls
    urls = json['urls'];
  }
}
