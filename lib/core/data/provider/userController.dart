// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/user_model.dart';
//
// class UserNotifier extends StateNotifier<UserModel?> {
//   UserNotifier() : super(null);
//
//   // Insert or set user data
//   void setUser(UserModel? user) {
//     state = user;
//   }
//
//   // Reset user state if needed
//   void clearUser() {
//     state = null;
//   }
// }
//
// final userProvider = StateNotifierProvider<UserNotifier, UserModel?>(
//       (ref) => UserNotifier(),
// );

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
