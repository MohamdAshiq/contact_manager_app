import 'package:flutter/material.dart';

class EmptyContactsMessageWidget extends StatelessWidget {
  const EmptyContactsMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_add_alt_1,
            size: 100,
            color: Theme.of(context).colorScheme.primary.withAlpha(125),
          ),
          const SizedBox(height: 30),
          Text(
            'No contacts yet..!!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 15),
          Text(
            'Tap the button below to add your first contact.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
