class JobModel {
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
  });

  int? id;
  String? namaPekerjaan;
  String? deskripsi;
  String? namaPerusahaan;
  num? gaji;
  String? logoPerusahaanPath;
  String? fotoLowongan;
  String? tentangPembukaLowongan;
  DateTime? tenggangWaktuPekerjaan;
  String? lokasiPekerjaan;
  String? kategori;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPekerjaan = json['nama_pekerjaan'];
    deskripsi = json['deskripsi'];
    namaPerusahaan = json['nama_perusahaan'];
    gaji = json['gaji'];
    logoPerusahaanPath = json['logo_perusahaan_path'];
    fotoLowongan = json['foto_lowongan'];
    tentangPembukaLowongan = json['tentang_pembuka_lowongan'];
    tenggangWaktuPekerjaan = DateTime.parse(json['tenggang_waktu_pekerjaan']);
    lokasiPekerjaan = json['lokasi_pekerjaan'];
    kategori = json['kategori'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
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
    };
  }
}
