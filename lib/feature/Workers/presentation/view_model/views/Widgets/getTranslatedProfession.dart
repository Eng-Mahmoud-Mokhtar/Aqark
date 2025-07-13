import 'package:flutter/cupertino.dart';
import '../../../../../../generated/l10n.dart';

String getTranslatedProfession(BuildContext context, String professionId) {
  switch (professionId) {
    case 'mason':
      return S.of(context).Mason;
    case 'plumber':
      return S.of(context).Plumber;
    case 'carpenter':
      return S.of(context).Carpenter;
    case 'electrician':
      return S.of(context).Electrician;
    case 'painter':
      return S.of(context).Painter;
    case 'ac_technician':
      return S.of(context).ACTechnician;
    default:
      return professionId;
  }
}
