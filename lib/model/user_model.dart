class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  double? lamaTerakhirBekerja;
  String? tempatTerakhirBekerja;
  String? posisiTerakhirBekerja;
  String? prestasi;
  String? skill;
  String? pendidikan;
  String? kewarganegaraan;
  String? alamat;
  String? roles;
  String? photoProfile;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.lamaTerakhirBekerja,
    this.tempatTerakhirBekerja,
    this.posisiTerakhirBekerja,
    this.prestasi,
    this.skill,
    this.pendidikan,
    this.kewarganegaraan,
    this.alamat,
    this.roles,
    this.photoProfile,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    lamaTerakhirBekerja = json['lama_terakhir_bekerja'];
    tempatTerakhirBekerja = json['tempat_terakhir_bekerja'];
    posisiTerakhirBekerja = json['posisi_terakhir_bekerja'];
    prestasi = json['prestasi'];
    skill = json['skill'];
    pendidikan = json['pendidikan'];
    kewarganegaraan = json['kewarganegaraan'];
    alamat = json['alamat'];
    roles = json['roles'];
    photoProfile = json['photoProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'lama_terakhir_bekerja': lamaTerakhirBekerja,
      'tempat_terakhir_bekerja': tempatTerakhirBekerja,
      'posisi_terakhir_bekerja': posisiTerakhirBekerja,
      'prestasi' : prestasi,
      'skill' : skill,
      'pendidikan' : pendidikan,
      'kewarganegaraan' : kewarganegaraan,
    };
  }
}
