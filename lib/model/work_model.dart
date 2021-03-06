class WorkModel {
  int? id;
  int? idPekerjaan;
  DateTime? createdAt;
  DateTime? updatedAt;

  WorkModel({
    this.id,
    this.idPekerjaan,
    this.createdAt,
    this.updatedAt,
  });

  WorkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPekerjaan = json['id_pekerjaan'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_pekerjaan': idPekerjaan,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
