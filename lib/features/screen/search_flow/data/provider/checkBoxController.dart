import 'package:flutter_riverpod/flutter_riverpod.dart';

final clickCheckBoxProvider = StateProvider.family<bool, int>((ref, id) => false);