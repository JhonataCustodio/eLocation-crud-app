import 'package:flutter/material.dart';

class CategoriaText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text.rich(
              TextSpan(
                text: 'Categoria',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: ' * ',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red)),
                  TextSpan(
                      text: ':', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
