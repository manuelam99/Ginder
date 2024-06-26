import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('images/xbox-control-icon-white.png'),
            width: 32.0,
            height: 32.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Ginder',
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}
