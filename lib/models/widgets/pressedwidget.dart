import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget customButton(
    {function,
    text,
    borderColor,
    textColor,
    arrowColor,
    fillColor,
    margin,
    height}) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              text,
              style: K.textStyle3.copyWith(color: textColor),
            ),
            Icon(
              FontAwesomeIcons.solidArrowAltCircleRight,
              color: arrowColor,
              size: 30,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customButton2(
    {function,
    text,
    borderColor,
    textColor,
    arrowColor,
    fillColor,
    margin,
    width,
    height}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        // borderRadius: BorderRadius?.circular(10.0) ?? BorderRadius?.circular(0.0),
        border: const Border(
          bottom: BorderSide(color: Colors.black38),
          top: BorderSide(color: Colors.black38),
          left: BorderSide(color: Colors.black38),
          right: BorderSide(color: Colors.black38),
        )),
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: K.textStyle3.copyWith(color: textColor, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(3.5),
              child: Icon(
                Icons.arrow_forward_ios,
                color: K.secondaryColor,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget customButton3(
    {function,
    text,
    borderColor,
    textColor,
    iconColor,
    fillColor,
    margin,
    height}) {
  return Container(
    height: 55,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: fillColor,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
          // )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.solidHandshake,
              color: iconColor,
              size: 30,
            ),
            Text(
              text,
              style: K.textStyle3.copyWith(color: textColor),
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
