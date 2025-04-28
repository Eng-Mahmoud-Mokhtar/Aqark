import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../Boardring/presentation/view_model/views/widgets/OnBoardring.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(true);

  void hideSplash() {
    emit(false);
  }
}

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: const _SplashViewContent(),
    );
  }
}

class _SplashViewContent extends StatefulWidget {
  const _SplashViewContent({Key? key}) : super(key: key);

  @override
  _SplashViewContentState createState() => _SplashViewContentState();
}

class _SplashViewContentState extends State<_SplashViewContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _fadeOutAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _fadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward().whenComplete(() {
      context.read<SplashCubit>().hideSplash();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, bool>(
      builder: (context, isSplashVisible) {
        return Stack(
          children: [
            const OnBoardingScreen(),
            if (isSplashVisible)
              FadeTransition(
                opacity: _fadeOutAnimation,
                child: Container(
                  color: KprimaryColor,
                  child: Center(
                    child: FadeTransition(
                      opacity: _fadeInAnimation,
                      child: Image.asset(
                        AssetsData.splash,
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}