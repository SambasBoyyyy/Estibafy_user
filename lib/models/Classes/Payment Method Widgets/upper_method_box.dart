import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

class UpperMethodBox extends StatefulWidget {
   UpperMethodBox({Key? key, this.function,this.center,this.text,this.color}) : super(key: key);
dynamic function;
dynamic center;
dynamic color;
dynamic text;

  @override
  State<UpperMethodBox> createState() => _UpperMethodBoxState();
}

class _UpperMethodBoxState extends State<UpperMethodBox> {
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: widget.function,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(color: K.primaryColor),
               borderRadius: BorderRadius?.circular(14) ?? BorderRadius?.circular(0.0),
              ),
              child: Center(
                child: widget.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                widget.text,
                style: K.textStyle2.copyWith(color: K.primaryColor),
              ),
            )
          ],
        ),
      );
    }
}
