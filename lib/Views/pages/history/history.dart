import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';

import 'package:flutter/material.dart';

import '../drawer.dart';

class History extends StatelessWidget {
  final bool isBackButton;
  History({Key? key, this.isBackButton = false}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar2('History', _scaffoldKey, context),
      backgroundColor:K.secondaryColor,
      drawer: const SideDrawer(),
      body: Center(
          child: Text(
        'No history to show',
        style: K.textStyle2.copyWith(color: K.sixthColor),
      )),
    );
  }
}
