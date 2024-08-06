import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({Key? key, required this.text, this.function, this.icon}) : super(key: key);

  final Widget text;
  final dynamic function;
  final dynamic icon;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: ListTile(
            onTap: widget.function,
            leading: Icon(
              widget.icon,
              color: K.primaryColor,
              size: 28,
            ),
            title: widget.text,
          ),
        ),
        Divider(
          color: K.sixthColor.withOpacity(0.2),
        ),
      ],
    );
  }
}
