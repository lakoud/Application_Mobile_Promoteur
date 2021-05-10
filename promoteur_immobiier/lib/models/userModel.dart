class UserModel {
  String email;
  String mptDePasse;
  String phone;
  String name;
  String uId;
  bool isEmailVerified;
  UserModel(
      {this.email,
      this.mptDePasse,
      this.name,
      this.phone,
      this.uId,
      this.isEmailVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    mptDePasse = json['mptDePasse'];
    phone = json['phone'];
    name = json['nom'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'mptDePasse': mptDePasse,
      'phone': phone,
      'nom': name,
      'uId': uId,
      'isEmailVerified': isEmailVerified
    };
  }
}
