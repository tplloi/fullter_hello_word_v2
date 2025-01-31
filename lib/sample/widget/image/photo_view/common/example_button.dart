import 'package:flutter/material.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class ExampleButtonNode extends StatelessWidget {
  const ExampleButtonNode({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 21.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text("Open roy93group"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
            ),
          )
        ],
      ),
    );
  }
}
