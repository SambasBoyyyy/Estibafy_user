class User {
  String? imagePath;
  String name;
  String email;
  String? userId;
  String phoneNumber;
  String? address;
  String? city;
  String? state;
  String? country;
  String password;
  int? paymentDays;

  User(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      this.imagePath,
      this.paymentDays,
      this.userId});

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'city': city,
        'id': userId,
        'state': state,
        'country': country,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'payment_days': paymentDays
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        city = json['city'],
        state = json['state'],
        userId = json['id'],
        country = json['country'],
        phoneNumber = json['phoneNumber'],
        email = json['email'],
        paymentDays = json['payment_days'],
        password = json['password'];
}
