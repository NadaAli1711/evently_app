class AppUser {
  static const String collectionName = 'Users';
  final String uId;
  final String name;
  final String email;

  AppUser({
    required this.uId,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
    };
  }


  AppUser.fromFireStore(Map<String, dynamic>? data)
      : this(
    uId: data?['uId'] ?? '',
    name: data?['name'] ?? '',
    email: data?['email'] ?? '',
  );
}