import 'package:choco_app/modules/account_module.dart';
import 'package:flutter/material.dart';

class MyProp {
  final Map<String, AccountModule> accountProp = {
    "prop 1": AccountModule(
      text: "Orders",
      leading: const Icon(Icons.card_giftcard_outlined),
    ),
    "prop 2": AccountModule(
      text: "Inbox",
      leading: const Icon(Icons.mail_outline),
    ),
    "prop 3": AccountModule(
      text: "Saved Items",
      leading: const Icon(Icons.favorite_border_outlined),
    ),
  };

  final Map<String, AccountModule> accountSetting = {
    "setting 1": AccountModule(text: "Address Book"),
    "setting 2": AccountModule(text: "Close Account"),
  };
}
