import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text('Ohhh no... Page Not Found :('),
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
