import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage the current index
class ImageIndexNotifier extends StateNotifier<int> {
  ImageIndexNotifier() : super(0); // Default index is 0

  // Method to update the index
  void updateIndex(int index) {
    state = index;
  }
}

// The provider for the ImageIndexNotifier
final imageIndexProvider = StateNotifierProvider<ImageIndexNotifier, int>((ref) {
  return ImageIndexNotifier();
});
