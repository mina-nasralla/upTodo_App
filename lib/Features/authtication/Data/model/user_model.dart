class UserModel {
  String? name;
  String? email;
  String? image;
  String? uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.image,
  });

  UserModel.fromjson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    uid = json?['uid'];
    image = json?['image'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'image': image,
    };
  }
}
