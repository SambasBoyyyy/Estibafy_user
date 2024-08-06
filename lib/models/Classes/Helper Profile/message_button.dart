

import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
 MessageButton({Key? key, this.function}) : super(key: key);
  dynamic function;
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
              backgroundColor: K.primaryColor,
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.message,
                  color: K.fifthColor,
                  size: 30,
                ),
                Text(
                  'Message',
                  style: K.textStyle3.copyWith(color: K.secondaryColor, fontSize: 17),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        ),
      );
    }
}
