import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Views/pages/book_helpers/home.dart';

getAppBar(title, key, {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: K.primaryColor,
    elevation: 0.0,
    toolbarHeight: 70,
    centerTitle: true,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: K.secondaryColor,
          radius: 18,
          child: IconButton(
              onPressed: () {
                key.currentState.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: K.darkBlue,
                size: 18,
              )),
        ),
      ),
    ),
    title: Text(
      title,
      style: K.textStyle2.copyWith(fontSize: 18, color: K.secondaryColor),
    ).tr(),
    actions: actions,
  );
}

getAppBar2(String title, key, context) {
  return AppBar(
    backgroundColor: K.primaryColor,
    elevation: 0.0,
    toolbarHeight: 90,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: K.secondaryColor,
          radius: 16,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: K.darkBlue,
                size: 15,
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: K.secondaryColor,
              radius: 16,
              child: IconButton(
                  onPressed: () {
                    key.currentState.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: K.darkBlue,
                    size: 17.5,
                  )),
            ),
            Text(
              title,
              style:
                  K.textStyle2.copyWith(fontSize: 18, color: K.secondaryColor),
            ).tr(),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
      ],
    ),
  );
}

getAppBar3(String title, key, context) {
  return AppBar(
    backgroundColor: K.primaryColor,
    elevation: 0.0,
    toolbarHeight: 90,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: K.secondaryColor,
          radius: 16,
          child: IconButton(
              onPressed: () {
                Get.to(const Home());
              },
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: K.darkBlue,
                size: 15,
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: K.secondaryColor,
              radius: 16,
              child: IconButton(
                  onPressed: () {
                    key.currentState.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: K.darkBlue,
                    size: 17.5,
                  )),
            ),
            Text(
              title,
              style:
                  K.textStyle2.copyWith(fontSize: 18, color: K.secondaryColor),
            ).tr(),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
      ],
    ),
  );
}
