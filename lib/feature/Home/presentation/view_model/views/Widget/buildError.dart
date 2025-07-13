import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../BodyHome_cubit.dart';

Widget buildError(BuildContext context) {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off, color: KprimaryColor, size: 60),
          SizedBox(height: 16),
          Text(
            S.of(context).loadingFailure,
            style: TextStyle(
              color: KprimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () => context.read<BodyHomeCubit>().loadData(),
            child: Text(
              S.of(context).retry,
              style: TextStyle(color: KprimaryColor),
            ),
          ),
        ],
      ),
    ),
  );
}
