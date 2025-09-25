import 'package:flutter_riverpod/flutter_riverpod.dart';

class Card {
  final String cardNumber;
  final bool isDefault;

  Card({required this.cardNumber, this.isDefault = true});

  // Add the copyWith method
  Card copyWith({String? cardNumber, bool? isDefault}) {
    return Card(
      cardNumber: cardNumber ?? this.cardNumber,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}


class PaymentCardNotifier extends StateNotifier<List<Card>> {
  PaymentCardNotifier() : super([]);

  // Add card to the list
  void addCard(Card card) {
    state = [...state, card];
  }

  // Mark a card as default
  void setDefaultCard(String cardNumber) {
    state = [
      for (final card in state)
        if (card.cardNumber == cardNumber)
          Card(cardNumber: card.cardNumber, isDefault: true)
        else
          card.copyWith(isDefault: false),
    ];
  }
}

final paymentCardProvider =
StateNotifierProvider<PaymentCardNotifier, List<Card>>((ref) {
  return PaymentCardNotifier();
});
