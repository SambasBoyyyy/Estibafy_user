

import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/wallet_addbalance_dialog.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius?.circular(14) ?? BorderRadius?.circular(0.0),
                  border: Border.all(color: K.tenthColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Text(
                        '\$ 500.00',
                        style:K. textStyle3.copyWith(color:K. primaryColor),
                      )),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        walletAddBalanceDialog(context);
                      },
                      icon: const Icon(FontAwesomeIcons.plusCircle)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add Balance',
                    style: K.textStyle2,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

  }
