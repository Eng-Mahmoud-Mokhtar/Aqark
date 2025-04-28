import 'package:bk/feature/Home/presentation/view_model/views/BottomHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/LocaleCubit.dart';
import 'package:bk/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/Boardring/presentation/view_model/views/widgets/OnBoardring.dart';
import 'feature/Home/presentation/view_model/views/Widget/BodyHome.dart';
import 'feature/Verifiy/presentation/view_model/views/widgets/code.dart';
import 'feature/login/presentation/view_model/views/widgets/phoneNumber.dart';
import 'feature/splash/presentation/view_model/views/widgets/splash_viev_body.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
            BlocProvider<OnBoardingCubit>(create: (context) => OnBoardingCubit()),
            BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()),
            BlocProvider<CodeCubit>(create: (context) => CodeCubit()),
            BlocProvider<CountryCubit>(create: (context) => CountryCubit()),
            BlocProvider<BodyHomeCubit>(create: (context) => BodyHomeCubit()),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          locale: locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}