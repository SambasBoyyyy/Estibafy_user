import 'package:estibafy_user/models/helpers_model.dart';
import 'package:estibafy_user/models/widgets/helpers_widget.dart';
import 'package:flutter/material.dart';

class Helpers extends StatelessWidget {
  const Helpers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: HelpersList.list.length,
      itemBuilder: (BuildContext context, int index) => BuildHelpersCard(
        context: context,
        index: index,
      ),
    );
  }
}
