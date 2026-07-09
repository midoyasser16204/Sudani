class UserEntity {
  final String uid;
  final String email;
  final String fullName;


  UserEntity({
    required this.uid,
    required this.email,
    required this.fullName,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
    };
  }

  UserEntity copyWith({
    String? uid,
    String? email,
    String? fullName,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
    );
  }
}