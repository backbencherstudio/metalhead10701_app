import 'package:flutter/material.dart';

class CommonCustomHeader extends StatelessWidget {
  final String? title;
  const CommonCustomHeader({
    super.key,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(title ?? ""),
      ],
    );
  }
}
