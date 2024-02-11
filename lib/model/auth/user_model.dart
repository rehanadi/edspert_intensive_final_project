class UserModel {
  // Properties
  final String email;
  final String token;
  final String refreshToken;
  final String message;

  // Constructor
  UserModel({
    required this.email,
    required this.token,
    required this.refreshToken,
    this.message = 'message',
  });

  // Setter/getter
  String? _name;
  void setName(String value) => _name = value;
  String? get name => _name;

  String? _password;
  void setPassword(String value) => _password = value;
  String? get password => _password;
}