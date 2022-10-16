import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class MovieNotFoundPage extends StatelessWidget {
  const MovieNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text('Ohhh no... Movie Not Found :('),
        const Spacer(),
        ElevatedButton(
          onPressed: () => context.replace('/'),
          child: const Text(
            'Back to Safety',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
