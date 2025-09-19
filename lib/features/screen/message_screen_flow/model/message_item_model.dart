// class MessageItem {
//   final String avatarUrl;
//   final String name;
//   final String message;
//   final String time;
//   final bool isOnline;
//   final bool isUnread;
//   final int unreadCount;
//
//   MessageItem({
//     required this.avatarUrl,
//     required this.name,
//     required this.message,
//     required this.time,
//     this.isOnline = false,
//     this.isUnread = false,
//     this.unreadCount = 0,
//   });
// }
//
// final messageList = [
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
//     name: "Rudy Schuppe",
//     message: "Lorem ipsum dolor sit amet...",
//     time: "8:35AM",
//     isOnline: true,
//     isUnread: true,
//     unreadCount: 3,
//   ),
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
//     name: "Lester Braun",
//     message: "Lorem ipsum dolor sit amet",
//     time: "8:35AM",
//     isOnline: true,
//     isUnread: true,
//     unreadCount: 3,
//   ),
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg",
//     name: "Ernestine O'Kon",
//     message: "Pdf.file",
//     time: "8:35AM",
//     isOnline: false,
//   ),
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/men/4.jpg",
//     name: "Morar-Goldner",
//     message: "I’ve reviewed your recent...",
//     time: "8:35AM",
//     isOnline: true,
//   ),
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/women/5.jpg",
//     name: "Sheila Bahringer",
//     message: "I’ve reviewed your recent...",
//     time: "8:35AM",
//     isOnline: false,
//   ),
//   MessageItem(
//     avatarUrl: "https://randomuser.me/api/portraits/men/6.jpg",
//     name: "Ralph Casper",
//     message: "I’ve reviewed your recent...",
//     time: "8:35AM",
//     isOnline: false,
//   ),

// ];

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageItem {
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final bool isOnline;
  final bool isUnread;
  final int unreadCount;
  final bool seenMessage;

  MessageItem({
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    this.isOnline = false,
    this.isUnread = false,
    this.unreadCount = 0,
    this.seenMessage = false,
  });
}

// Holds full message list and manages deletions
class MessageListNotifier extends StateNotifier<List<MessageItem>> {
  MessageListNotifier()
    : super([
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
          name: "Rudy Schuppe",
          message: "Lorem ipsum dolor sit amet...",
          time: "8:35AM",
          isOnline: true,
          isUnread: true,
          unreadCount: 3,
          seenMessage: false,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
          name: "Lester Braun",
          message: "Lorem ipsum dolor sit amet",
          time: "8:35AM",
          isOnline: true,
          isUnread: true,
          unreadCount: 3,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg",
          name: "Ernestine O'Kon",
          message: "Pdf.file",
          time: "8:35AM",
          isOnline: false,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/4.jpg",
          name: "Morar-Goldner",
          message: "I’ve reviewed your recent...",
          time: "8:35AM",
          isOnline: true,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/women/5.jpg",
          name: "Sheila Bahringer",
          message: "I’ve reviewed your recent...",
          time: "8:35AM",
          isOnline: false,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/6.jpg",
          name: "Ralph Casper",
          message: "I’ve reviewed your recent...",
          time: "8:35AM",
          isOnline: false,
          seenMessage: true,
        ),

        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/7.jpg",
          name: "Ralph Casper",
          message: "I’ve reviewed your recent...",
          time: "8:35AM",
          isOnline: false,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/8.jpg",
          name: "Ralph Casper",
          message: "I’ve reviewed your recent...",
          time: "8:35AM",
          isOnline: false,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/9.jpg",
          name: "Rasu",
          message: "rasu.pdf",
          time: "8:35AM",
          isOnline: false,
          unreadCount: 3,
          isUnread: true,
          seenMessage: true,
        ),
        MessageItem(
          avatarUrl: "https://randomuser.me/api/portraits/men/10.jpg",
          name: "Santo",
          message: "I am not coming home for a long time",
          time: "8:35AM",
          isOnline: false,
          unreadCount: 10,
          isUnread: true,
          seenMessage: false,
        ),
      ]);

  void removeMessage(MessageItem item) {
    state = state.where((m) => m != item).toList();
  }
}
