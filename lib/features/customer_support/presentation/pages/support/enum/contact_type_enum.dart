// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ContactTypes { FACEBOOK, MESSENGER, TELEGRAM, VIBER, EMAIL, PHONE }

IconData contactTypeMapper(String? contactType) {
  switch (contactType) {
    case "FACEBOOK":
      return FontAwesomeIcons.facebook;
    case "MESSENGER":
      return FontAwesomeIcons.facebookMessenger;
    case "TELEGRAM":
      return FontAwesomeIcons.telegram;
    case "VIBER":
      return FontAwesomeIcons.viber;
    case "PHONE":
      return FontAwesomeIcons.mobile;
    default:
      return FontAwesomeIcons.envelope;
  }
}
