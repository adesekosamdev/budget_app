// class User {
//   final String token;

//   User({required this.token});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       token: json['token'],
//     );
//   }
// }

class User {
  final int id;
  final String email;
  final String token;

  User({required this.id, required this.email, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      token: json['token'],
    );
  }
}
