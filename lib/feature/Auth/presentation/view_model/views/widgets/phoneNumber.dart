import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import 'CountryContent.dart';
import 'countryList.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState.initial());

  void filterCountries(String query) {
    emit(state.copyWith(
      filteredCountries: countryList
          .where((country) =>
      country['name']!.toLowerCase().contains(query.toLowerCase()) ||
          country['code']!.contains(query))
          .toList(),
    ));
  }

  void resetFilter() {
    emit(state.copyWith(filteredCountries: List.from(countryList)));
  }

  void selectCountry(Map<String, String> country) {
    emit(state.copyWith(
      selectedCountryCode: country['code']!,
      selectedCountryFlag: country['flag']!,
      selectedCountryShort: country['short']!,
    ));
  }
}

class CountryState {
  final String selectedCountryCode;
  final String selectedCountryFlag;
  final String selectedCountryShort;
  final List<Map<String, String>> filteredCountries;

  CountryState({
    required this.selectedCountryCode,
    required this.selectedCountryFlag,
    required this.selectedCountryShort,
    required this.filteredCountries,
  });

  CountryState copyWith({
    String? selectedCountryCode,
    String? selectedCountryFlag,
    String? selectedCountryShort,
    List<Map<String, String>>? filteredCountries,
  }) {
    return CountryState(
      selectedCountryCode: selectedCountryCode ?? this.selectedCountryCode,
      selectedCountryFlag: selectedCountryFlag ?? this.selectedCountryFlag,
      selectedCountryShort: selectedCountryShort ?? this.selectedCountryShort,
      filteredCountries: filteredCountries ?? this.filteredCountries,
    );
  }

  static CountryState initial() {
    return CountryState(
      selectedCountryCode: '+1',
      selectedCountryFlag: '🇺🇸',
      selectedCountryShort: 'US',
      filteredCountries: List.from(countryList),
    );
  }
}


class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void showCountryPicker(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.95,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: CountryContent(screenWidth: screenWidth),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    }

    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text:  S.of(context).PhoneNumber,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold),
                children: const [
                  TextSpan(
                    text: ' * ',
                    style: TextStyle(
                        color: SecondaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              height: screenWidth * 0.12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffE9E9E9))),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => showCountryPicker(context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: Row(
                          children: [
                            Text(state.selectedCountryShort,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold)),
                            Icon(Icons.keyboard_arrow_down,
                                size: screenWidth * 0.05,
                                color: Colors.grey.shade500),
                            SizedBox(width: screenWidth * 0.01),
                            Container(
                                height: screenWidth * 0.1,
                                width: 1.0,
                                color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          hintText: '1001234567',
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.035),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
