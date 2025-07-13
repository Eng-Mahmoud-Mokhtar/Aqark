import 'package:bk/feature/Home/presentation/view_model/views/Widget/BottomHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:bk/core/utiles/LocaleCubit.dart';
import 'package:bk/generated/l10n.dart';
import 'feature/Auth/presentation/view_model/views/widgets/code.dart';
import 'feature/Auth/presentation/view_model/views/widgets/phoneNumber.dart';
import 'feature/Boardring/presentation/view_model/views/widgets/OnBoardring.dart';
import 'feature/Home/presentation/view_model/BodyHome_cubit.dart';
import 'feature/Notification/presentation/view_model/NotificationCubit.dart';
import 'feature/splash/presentation/view_model/views/splash_view.dart';
import 'feature/splash/presentation/view_model/views/widgets/splash_viev_body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => BodyHomeCubit()..loadData()),
              BlocProvider(create: (_) => BottomNavCubit()),
              BlocProvider(create: (_) => SplashCubit()),
              BlocProvider(create: (_) => OnBoardingCubit()),
              BlocProvider(create: (_) => LocaleCubit()),
              BlocProvider(create: (_) => CodeCubit()),
              BlocProvider(create: (_) => CountryCubit()),
              BlocProvider(create: (_) => NotificationCubit()),
            ],
            child: const MyApp(),
          );
        },
      ),
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
          home: SplashScreen(),
        );
      },
    );
  }
}
