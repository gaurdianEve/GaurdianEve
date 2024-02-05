class UserProfile {
  
  final String id;
  final String username;
  final String email;
  final String avatarURL;
  //TODO:add the friend field
  const UserProfile(
    this.id,
    this.avatarURL,
    this.username,
    this.email,
  );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatarURL': avatarURL,
      'username': username,
      'email': email,
    };
  }
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      json['id'] as String,
      json['avatarURL'] as String,
      json['username'] as String,
      json['email'] as String,
    );
  }

  UserProfile copyWith({
    String? id,
    String? avatarURL,
    String? username,
    String? email,
  }) {
    return UserProfile(
      id ?? this.id,
      avatarURL ?? this.avatarURL,
      username ?? this.username,
      email ?? this.email,
    );
  }
   // Override toString for better debugging
  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, avatarURL: $avatarURL}';
  }
}
