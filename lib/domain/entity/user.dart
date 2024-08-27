class User {
  final String id;
  final String username;
  final String email;
  final String name;
  final String phone;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? name,
    String? phone,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
