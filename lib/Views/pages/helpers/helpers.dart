import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:estibafy_user/Controller/Tab%20Controller/helper_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../drawer.dart';
import '../../../models/Classes/Helper Class/favorites_helpers.dart';
import '../../../models/Classes/Helper Class/helpers_tab.dart';

class HelpersTabBar extends StatefulWidget {
  const HelpersTabBar({Key? key}) : super(key: key);

  @override
  State<HelpersTabBar> createState() => _HelpersTabBarState();
}

class _HelpersTabBarState extends State<HelpersTabBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 HelperControllers helperControllers= Get.put(HelperControllers());

  int cupertinoTabBarIIIValueGetter() => helperControllers.cupertinoTabBarIIIValue.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Helpers', _scaffoldKey, context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
               // borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                border: Border.all(color: K.sixthColor, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CupertinoTabBar.CupertinoTabBar(
                    Colors.transparent,
                    K.primaryColor,
                    [
                      Text(
                        "Helpers",
                        style: K.textStyle3.copyWith(
                            color: helperControllers.cupertinoTabBarIIIValue.value== 0
                                ? K.secondaryColor
                                : K.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Favorites",
                        style: K.textStyle3.copyWith(
                            color:helperControllers.cupertinoTabBarIIIValue.value == 1
                                ?K. secondaryColor
                                : K.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    cupertinoTabBarIIIValueGetter,
                    (int index) {
                      setState(() {
                        helperControllers.cupertinoTabBarIIIValue.value = index;
                      });
                    },
                    useShadow: false,
                    allowExpand: true,
                    useSeparators: false,
                    innerVerticalPadding: 14,
                    innerHorizontalPadding: 15,
                    outerHorizontalPadding: 15,
                    outerVerticalPadding: 12,
                  //  borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child:helperControllers.cupertinoTabBarIIIValue.value== 0
                    ? const Helpers()
                    : const FavoritesHelpers(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
