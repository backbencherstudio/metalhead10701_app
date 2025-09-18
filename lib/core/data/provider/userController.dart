import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_registry_model.dart';

final userRegistryProvider = StateNotifierProvider<UserRegistryNotifier, List<UserRegistryModel>>(
      (ref) => UserRegistryNotifier(),
);

class UserRegistryNotifier extends StateNotifier<List<UserRegistryModel>> {
  UserRegistryNotifier() : super([]);

  void insertUser(UserRegistryModel user) {
    state = [...state, user];
  }

  void deleteUser(String username) {
    state = state.where((user) => user.username != username).toList();
  }

  void updateUser(UserRegistryModel updatedUser) {
    state = state.map((user) {
      if (user.username == updatedUser.username) {
        return UserRegistryModel(
          username: user.username,
          name: updatedUser.name ?? user.name,
          firstName: updatedUser.firstName ?? user.firstName,
          lastName: updatedUser.lastName ?? user.lastName,
          email: updatedUser.email ?? user.email,
          password: updatedUser.password ?? user.password,
          phoneNumber: updatedUser.phoneNumber ?? user.phoneNumber,
          type: updatedUser.type ?? user.type,
        );
      } else {
        return user;
      }
    }).toList();
  }

  void clearUsers() {
    state = [];
  }
}