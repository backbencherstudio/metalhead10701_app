import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCardList {
  final String cardNumber;
  final String cardHolderName;
  final String expirationDate;
  final String cvv;

  AddCardList({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expirationDate,
    required this.cvv,
  });
}

class CardNotifier extends StateNotifier<List<AddCardList>> {
  CardNotifier() : super([]);

  // Method to add a new card
  void addCard(AddCardList card) {
    state = [...state, card];
  }

  // Method to delete a card (for future use)
  void deleteCard(int index) {
    state = [...state]..removeAt(index);
  }

  void updateCard(int index, AddCardList updatedCard) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) updatedCard else state[i]
    ];
  }
}



// The provider for the state
final cardProvider = StateNotifierProvider<CardNotifier, List<AddCardList>>(
      (ref) => CardNotifier(),
);
