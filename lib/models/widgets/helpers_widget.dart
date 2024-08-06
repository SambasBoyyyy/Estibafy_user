import 'package:estibafy_user/models/helpers_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildHelpersCard extends StatefulWidget {
  final BuildContext context;
  final int index;

  const BuildHelpersCard({
    Key? key,
    required this.context,
    required this.index,
  }) : super(key: key);

  @override
  _BuildHelpersCardState createState() => _BuildHelpersCardState();
}

class _BuildHelpersCardState extends State<BuildHelpersCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return buildHelpersCard(widget.context, widget.index);
  }

  buildHelpersCard(BuildContext context, int index) {
    final data = HelpersList.list[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
        side:  BorderSide(color:  K.sixthColor),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 15, bottom: 5, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor:  K.fourthColor,
                            backgroundImage: NetworkImage(data.avatar),
                            radius: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color:  K.ninthColor,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 1.5,
                            ),
                            Text(
                              data.rating.toString(),
                              style:  K.textStyle5,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                     SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        color:  K.tenthColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color:  K.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data.email,
                              style:  K.textStyle5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                             Icon(
                              Icons.phone,
                              color:  K.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(data.phone, style:  K.textStyle5),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person_pin_rounded,
                              color: K.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(data.ID, style: K.textStyle5),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (isFavorite == false) {
                          setState(() {
                            isFavorite = true;
                          });
                        } else {
                          setState(() {
                            isFavorite = false;
                          });
                        }
                      },
                      icon: isFavorite == false
                          ? Icon(
                              Icons.favorite_border,
                              color: K.fourthColor,
                              size: 22,
                            )
                          :  Icon(
                              Icons.favorite,
                              color: K.eighthColor,
                              size: 22,
                            ),
                    ),
                    data.isVerified == true
                        ? Row(
                            children: [
                               Icon(
                                FontAwesomeIcons.checkCircle,
                                color: K.fifthColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Verified',
                                style: K.textStyle5,
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 140,
                  decoration:BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(6)),
                    color: K.fifthColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Icon(
                        Icons.local_phone,
                        color: K.secondaryColor,
                      ),
                      Text(
                        'Call',
                        style: K.textStyle2.copyWith(
                            color: K.secondaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 140,
                  decoration:  BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15)),
                    color: K.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Icon(
                        Icons.chat_bubble_outline,
                        color: K.secondaryColor,
                      ),
                      Text(
                        'Chat',
                        style: K.textStyle2.copyWith(
                            color: K.secondaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
