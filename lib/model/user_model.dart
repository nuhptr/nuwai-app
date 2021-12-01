class UserModel {
  int? id;
  String? name;
  String? email;
  String? cvPath;
  String? alamat;
  String? photoProfile;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.cvPath,
    this.alamat,
    this.photoProfile,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    alamat = json['alamat'];
    photoProfile = json['profile_photo_url'];
    cvPath = json['cv_path'];
    // TODO: biasakan parse jika bukan string
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    token = json['token'];
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'alamat': alamat,
      'profile_photo_path': photoProfile,
      'cv_path': cvPath,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
    };
  }
}
