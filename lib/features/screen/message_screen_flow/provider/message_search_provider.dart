import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../search_flow/data/provider/search_controller.dart';
import '../model/message_item_model.dart';

final messageListProvider =
    StateNotifierProvider<MessageListNotifier, List<MessageItem>>(
      (ref) => MessageListNotifier(),
    );

final filteredMessageListProvider = Provider<List<MessageItem>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();
  final messages = ref.watch(messageListProvider);
  if (query.isEmpty) {
    return messages;
  }
  return messages
      .where((msg) => msg.name.toLowerCase().contains(query))
      .toList();
});
