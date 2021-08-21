class JobModel {
  int? id;
  String? namaPekerjaan;
  String? deskripsi;
  String? namaPerusahaan;
  double? gaji;
  String? logoPerusahaanPath;
  String? fotoLowongan;
  String? tentangPembukaLowongan;
  DateTime? tenggangWaktuPekerjaan;
  String? lokasiPekerjaan;
  String? kategori;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  JobModel({
    this.id,
    this.namaPekerjaan,
    this.deskripsi,
    this.namaPerusahaan,
    this.gaji,
    this.logoPerusahaanPath,
    this.fotoLowongan,
    this.tentangPembukaLowongan,
    this.tenggangWaktuPekerjaan,
    this.lokasiPekerjaan,
    this.kategori,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPekerjaan = json['nama_pekerjaan'];
    deskripsi = json['deskripsi'];
    namaPerusahaan = json['nama_perusahaan'];
    gaji = json['gaji'];
    logoPerusahaanPath = json['logo_perusahaan_path'];
    fotoLowongan = json['foto_lowongan'];
    tentangPembukaLowongan = json['tentang_pembuka_lowongan'];
    tenggangWaktuPekerjaan = json['tenggang_waktu_pekerjaan'];
    lokasiPekerjaan = json['lokasi_pekerjaan'];
    kategori = json['kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_pekerjaan': namaPekerjaan,
      'nama_perusahaan': namaPerusahaan,
      'deskripsi': deskripsi,
      'gaji': gaji,
      'logo_perusahaan_path': logoPerusahaanPath,
      'foto_lowongan': fotoLowongan,
      'tentang_pembuka_lowongan': tentangPembukaLowongan,
      'tenggang_waktu_lamaran': tenggangWaktuPekerjaan,
      'kategori': kategori,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
