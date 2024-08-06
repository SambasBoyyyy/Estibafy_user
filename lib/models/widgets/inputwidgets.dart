import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

Widget input(
    {obscure = false,
    text,
    prefix,
    prefixColor = const Color(0xff989898),
    controller,
    suffix,
    onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: SizedBox(
      height: 58,
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: Stack(
              children: [
                TextField(
                  controller: controller,
                  obscureText: obscure,
                  cursorColor: K.primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: K.textStyle2
                        .copyWith(color: K.tenthColor.withOpacity(0.8)),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Icon(
                        prefix,
                        color: prefixColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: K.textStyle2.copyWith(fontSize: 16),
                  onChanged: (value) {
                    if (onChanged != null) {
                      onChanged(value);
                    }
                  },
                ),
                suffix != null
                    ? Positioned(top: 5, right: 0, child: suffix)
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Divider(color: K.sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}

Widget input2(
    {obscure = false,
    text,
    prefix,
    prefixColor = const Color(0xff989898),
    suffix,
    bool isEnabled = true,
    controller,
    onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: SizedBox(
      height: 58,
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: Stack(
              children: [
                TextField(
                  onChanged: (value) {
                    onChanged(value);
                  },
                  enabled: isEnabled,
                  controller: controller,
                  obscureText: obscure,
                  cursorColor: K.primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: K.textStyle2
                        .copyWith(color: K.tenthColor.withOpacity(0.8)),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 40, top: 10, bottom: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Icon(
                        prefix,
                        color: prefixColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: K.textStyle2.copyWith(fontSize: 16),
                ),
                Positioned(top: 10, right: 0, child: suffix),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: K.sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}

Widget input3({text, suffix, controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius?.circular(16) ?? BorderRadius?.circular(0.0),
        color: K.fourteenColor,
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            cursorColor: K.secondaryColor,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: K.textStyle2
                  .copyWith(color: K.secondaryColor.withOpacity(0.8)),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            ),
            style: K.textStyle2.copyWith(fontSize: 16, color: K.secondaryColor),
          ),
          suffix != null
              ? Positioned(top: 0, bottom: 0, right: 10, child: suffix)
              : Container(),
        ],
      ),
    ),
  );
}

Widget input4({
  text,
  controller,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1),
    child: SizedBox(
      height: 52,
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: Stack(
              children: [
                TextField(
                  controller: controller,
                  cursorColor: K.primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: K.textStyle3,
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  ),
                  textAlign: TextAlign.center,
                  style: K.textStyle3,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Divider(color: K.sixthColor.withOpacity(0.8)),
          ),
        ],
      ),
    ),
  );
}

Widget input5(
    {text,
    controller,
    context,
    required String title,
    required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius?.circular(10.0)  ?? BorderRadius?.circular(0.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: K.primaryColor,
          ),
          const SizedBox(
            width: 5.0,
          ),
          VerticalDivider(
            thickness: 0.2,
            color: K.primaryColor,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: K.primaryColor, fontSize: 11),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 30,
                child: TextField(
                  controller: controller,
                  cursorColor: K.primaryColor,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: K.textStyle3,
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  ),
                  style: K.textStyle3,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget input6({
  required Widget textField,
  required BuildContext context,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius?.circular(10.0) ?? BorderRadius?.circular(0.0),
      ),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 30,
          child: textField),
    ),
  );
}
