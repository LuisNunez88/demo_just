import 'dart:convert';

import '../../domain/entities/user.dart';
import '../models/user_response.dart';

class UserMapper {
  UserMapper._();
  static User responseToEntity(UserResponse resp) => User(
        id: resp.id,
        name: resp.name,
        email: resp.email,
        avatar: resp.image ??
            'https://upload.wikimedia.org/wikipedia/commons/d/d5/User_Default_Gravatar.png?20201228191829',
      );

  static User dbToEntity(String data) {
    final json = jsonDecode(data) as Map<String, dynamic>;
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  static String entityToDb(User data) {
    return jsonEncode({
      'id': data.id,
      'name': data.name,
      'email': data.email,
      'avatar': data.avatar ??
          'https://upload.wikimedia.org/wikipedia/commons/d/d5/User_Default_Gravatar.png?20201228191829',
    });
  }
}
