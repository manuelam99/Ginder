import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/ui/widgets/bordered_text_field.dart';

class EmailAndPasswordScreen extends StatelessWidget {
  final Function(String) emailOnChanged;
  final Function(String) passwordOnChanged;

  EmailAndPasswordScreen(
      {@required this.emailOnChanged, @required this.passwordOnChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mi correo y',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Contraseña son',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 25),
        BorderedTextField(
          labelText: 'Correo',
          onChanged: emailOnChanged,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 5),
        BorderedTextField(
          labelText: 'Contraseña',
          onChanged: passwordOnChanged,
          obscureText: true,
        ),
      ],
    );
  }
}
