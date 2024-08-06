import 'package:estibafy_user/models/favorites_helpers_model.dart';
import 'package:estibafy_user/models/widgets/favorites_helpers_widget.dart';
import 'package:flutter/material.dart';

class FavoritesHelpers extends StatelessWidget {
  const FavoritesHelpers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: FavoritesHelpersList.list.length,
      itemBuilder: (BuildContext context, int index) =>
          BuildFavoritesHelpersCard(
        context: context,
        index: index,
      ),
    );
  }
}
