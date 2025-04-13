import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? phoneNumber;
  final String? address;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.phoneNumber,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profileImage: map['profileImage'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }
}

class UserProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // TODO: Implement actual login logic
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = User(
      id: '1',
      name: 'John Doe',
      email: email,
      profileImage: 'https://picsum.photos/211',
      phoneNumber: '+1234567890',
      address: '123 Main St, City, Country',
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // TODO: Implement actual registration logic
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = User(
      id: '1',
      name: name,
      email: email,
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? profileImage,
  }) async {
    if (_currentUser == null) return;

    _isLoading = true;
    notifyListeners();

    // TODO: Implement actual profile update logic
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = User(
      id: _currentUser!.id,
      name: name ?? _currentUser!.name,
      email: email ?? _currentUser!.email,
      profileImage: profileImage ?? _currentUser!.profileImage,
      phoneNumber: phoneNumber ?? _currentUser!.phoneNumber,
      address: address ?? _currentUser!.address,
    );

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
} 