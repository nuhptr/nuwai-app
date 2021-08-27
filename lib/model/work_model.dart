class WorkModel {
  WorkModel({
    this.id,
    this.idPekerjaan,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idPekerjaan;
  DateTime? createdAt;
  DateTime? updatedAt;

  WorkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPekerjaan = json['id_pekerjaan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
