

import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

class UpperLogo extends StatelessWidget {
  const UpperLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/logo.png'),
            width: 60,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            'Sign Up',
            style:K. titleTextStyle.copyWith(fontSize: 36),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      );
    }
}
