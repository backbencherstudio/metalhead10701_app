import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  // Insert or set user data
  void setUser(UserModel user) {
    state = user;
  }

  // Update fields selectively
  void updateUser({
    String? name,
    String? username,
    String? email,
    String? avatar,
    String? phoneNumber,
    String? type,
    String? gender,
    String? address,
  }) {
    if (state == null) return;

    state = UserModel(
      id: state!.id,
      name: name ?? state!.name,
      username: username ?? state!.username,
      email: email ?? state!.email,
      avatar: state!.avatar,
      phoneNumber: state!.phoneNumber,
      type: state!.type,
      gender: state!.gender,
      address: state!.address,
      state: state!.state,
      city: state!.city,
      zipCode: state!.zipCode,
      skills: state!.skills,
      bio: state!.bio,
      age: state!.age,
      dateOfBirth: state!.dateOfBirth,
      createdAt: state!.createdAt,
    );
  }

  // Reset user state if needed
  void clearUser() {
    state = null;
  }
}
