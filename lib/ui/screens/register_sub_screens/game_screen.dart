import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/ui/widgets/bordered_text_field.dart';

class GameScreen extends StatelessWidget {
  final Function(String) onChanged;

  GameScreen({@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                'Mi juego',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'favorito es',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Expanded(
          child: BorderedTextField(
            labelText: 'Juego',
            onChanged: onChanged,
            textCapitalization: TextCapitalization.words,
          ),
        ),
      ],
    );
  }
}
