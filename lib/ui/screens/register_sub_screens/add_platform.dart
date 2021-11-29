import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class PlatformScreen extends StatefulWidget {
  final Function(String) onChanged;

  PlatformScreen({@required this.onChanged});

  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  List<String> plataformas = ["XBox", "PlayStation", "Nintendo", "PC", "Otro"];
  String plataformaElegida = "XBox";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mi plataforma',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'favorita es',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              child: DropdownButton(
                value: plataformaElegida,
                onChanged: (newValue) {
                  setState(() {
                    plataformaElegida = newValue;
                  });
                  widget.onChanged(newValue);
                },
                items: plataformas.map((plat) {
                  return DropdownMenuItem(
                    child:
                        new Text(plat, style: TextStyle(color: Colors.black)),
                    value: plat,
                  );
                }).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
