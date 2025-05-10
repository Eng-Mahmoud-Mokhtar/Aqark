import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Explore/presentation/view_model/views/explore.dart';
import '../../../../Workers/presentation/view_model/views/Workers.dart';
import '../../../../More/presentation/view_model/views/MoreScreen.dart';
import 'Widget/BodyHome.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  void setIndex(int index) => emit(index);
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [
      const BodyHome(),
      ExplorePage(apartments: [],),
      WorkersScreen(),
      const MoreScreen(),
    ];

    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: IndexedStack(
              index: selectedIndex,
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: screenHeight * 0.018, fontWeight: FontWeight.bold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
              currentIndex: selectedIndex,
              onTap: (index) => context.read<BottomNavCubit>().setIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'Assets/icons8-home-32.png',
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    color: selectedIndex == 0 ? KprimaryColor : const Color(0xffb8b8b8),
                  ),
                  label: S.of(context).bottomHome,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'Assets/icons-search-.png',
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    color: selectedIndex == 1 ? KprimaryColor : const Color(0xffb8b8b8),
                  ),
                  label: S.of(context).bottomExplore,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'Assets/icons8-bag-96.png',
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    color: selectedIndex == 2 ? KprimaryColor : const Color(0xffb8b8b8),
                  ),
                  label: S.of(context).Workers,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    size: screenWidth * 0.05,
                    color: selectedIndex == 3 ? KprimaryColor : const Color(0xffb8b8b8),
                  ),
                  label: S.of(context).bottomMore,
                ),
              ],
              selectedItemColor: KprimaryColor,
              unselectedItemColor: const Color(0xff9E9E9E),
              selectedFontSize: screenWidth * 0.03,
              unselectedFontSize: screenWidth * 0.03,
            ),
          );
        },
      ),
    );
  }
}
