import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _services = [
    ["Deposit Cash", "lib/icons/deposit.png"],
    ["Send Money", "lib/icons/send.png"],
    ["Receive Payment", "lib/icons/receive.png"],
    ["Withdraw Cash", "lib/icons/withdraw.png"],
  ];

  final List _activities = [
    ["Buy Airtime/Package", "lib/icons/tele.png"],
    ["Pay with telebirr", "lib/icons/telebirr.png"],
    ["Pay for Merchant", "lib/icons/merchant.png"],
    ["GERD", "lib/icons/GERD-Icon.png"],
  ];

  get cardItems => _services;
  get cardItems2 => _activities;
}