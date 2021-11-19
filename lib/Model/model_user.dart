class UserModel {
  int page = 0;
  int perPage = 0;
  int total = 0;
  int totalPage = 0;
  List<User> data = [];
  String error = "";

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  UserModel(
      {this.page = 0,
      this.perPage = 0,
      this.total = 0,
      this.totalPage = 0,
      this.data = const []});

  UserModel.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPage = json["total_pages"];
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data.add(User.fromJson(v));
      });
    }
  }
}

class User {
  int idUser = 0;
  String email = "";
  String firstName = "";
  String lastName = "";
  String avatar = "";

  User(
      {this.idUser = 0,
      this.email = "",
      this.firstName = "",
      this.lastName = "",
      this.avatar = ""});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json["id"];
    email = json["email"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    avatar = json["avatar"];
  }
}
