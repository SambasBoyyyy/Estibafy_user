import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelperInstructionBox extends StatelessWidget {
  const HelperInstructionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
       // borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
      ),
      elevation: 4,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Add voice instructions',
                style: K.textStyle3.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'It help the HELPER to get to your',
                style: K.textStyle2.copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                ' location faster',
                style: K.textStyle2.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Hold the button to records',
                style: K.textStyle2.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 42,
                width: 130,
                decoration: BoxDecoration(
                  color: K.eleventhColor,
                  //borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                ),
                child: IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('coming soon')));
                    },
                    icon: Icon(
                      FontAwesomeIcons.microphone,
                      color: K.secondaryColor,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
