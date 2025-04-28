import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';

// CountryCubit لإدارة حالة اختيار الدولة
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

// قائمة الدول
final List<Map<String, String>> countryList = [
  {'flag': '🇦🇫', 'code': '93', 'name': 'Afghanistan', 'short': 'AF'},
  {'flag': '🇦🇱', 'code': '355', 'name': 'Albania', 'short': 'AL'},
  {'flag': '🇩🇿', 'code': '213', 'name': 'Algeria', 'short': 'DZ'},
  {'flag': '🇦🇩', 'code': '376', 'name': 'Andorra', 'short': 'AD'},
  {'flag': '🇦🇴', 'code': '244', 'name': 'Angola', 'short': 'AO'},
  {'flag': '🇦🇷', 'code': '54', 'name': 'Argentina', 'short': 'AR'},
  {'flag': '🇦🇲', 'code': '374', 'name': 'Armenia', 'short': 'AM'},
  {'flag': '🇦🇺', 'code': '61', 'name': 'Australia', 'short': 'AU'},
  {'flag': '🇦🇹', 'code': '43', 'name': 'Austria', 'short': 'AT'},
  {'flag': '🇦🇿', 'code': '994', 'name': 'Azerbaijan', 'short': 'AZ'},
  {'flag': '🇧🇭', 'code': '973', 'name': 'Bahrain', 'short': 'BH'},
  {'flag': '🇧🇩', 'code': '880', 'name': 'Bangladesh', 'short': 'BD'},
  {'flag': '🇧🇪', 'code': '32', 'name': 'Belgium', 'short': 'BE'},
  {'flag': '🇧🇷', 'code': '55', 'name': 'Brazil', 'short': 'BR'},
  {'flag': '🇨🇦', 'code': '1', 'name': 'Canada', 'short': 'CA'},
  {'flag': '🇨🇳', 'code': '86', 'name': 'China', 'short': 'CN'},
  {'flag': '🇪🇬', 'code': '20', 'name': 'Egypt', 'short': 'EG'},
  {'flag': '🇫🇷', 'code': '33', 'name': 'France', 'short': 'FR'},
  {'flag': '🇩🇪', 'code': '49', 'name': 'Germany', 'short': 'DE'},
  {'flag': '🇮🇳', 'code': '91', 'name': 'India', 'short': 'IN'},
  {'flag': '🇮🇶', 'code': '964', 'name': 'Iraq', 'short': 'IQ'},
  {'flag': '🇮🇹', 'code': '39', 'name': 'Italy', 'short': 'IT'},
  {'flag': '🇯🇵', 'code': '81', 'name': 'Japan', 'short': 'JP'},
  {'flag': '🇰🇼', 'code': '965', 'name': 'Kuwait', 'short': 'KW'},
  {'flag': '🇲🇾', 'code': '60', 'name': 'Malaysia', 'short': 'MY'},
  {'flag': '🇲🇽', 'code': '52', 'name': 'Mexico', 'short': 'MX'},
  {'flag': '🇲🇦', 'code': '212', 'name': 'Morocco', 'short': 'MA'},
  {'flag': '🇳🇱', 'code': '31', 'name': 'Netherlands', 'short': 'NL'},
  {'flag': '🇳🇿', 'code': '64', 'name': 'New Zealand', 'short': 'NZ'},
  {'flag': '🇳🇬', 'code': '234', 'name': 'Nigeria', 'short': 'NG'},
  {'flag': '🇳🇴', 'code': '47', 'name': 'Norway', 'short': 'NO'},
  {'flag': '🇴🇲', 'code': '968', 'name': 'Oman', 'short': 'OM'},
  {'flag': '🇵🇰', 'code': '92', 'name': 'Pakistan', 'short': 'PK'},
  {'flag': '🇵🇭', 'code': '63', 'name': 'Philippines', 'short': 'PH'},
  {'flag': '🇶🇦', 'code': '974', 'name': 'Qatar', 'short': 'QA'},
  {'flag': '🇷🇺', 'code': '7', 'name': 'Russia', 'short': 'RU'},
  {'flag': '🇸🇦', 'code': '966', 'name': 'Saudi Arabia', 'short': 'SA'},
  {'flag': '🇿🇦', 'code': '27', 'name': 'South Africa', 'short': 'ZA'},
  {'flag': '🇰🇷', 'code': '82', 'name': 'South Korea', 'short': 'KR'},
  {'flag': '🇪🇸', 'code': '34', 'name': 'Spain', 'short': 'ES'},
  {'flag': '🇸🇪', 'code': '46', 'name': 'Sweden', 'short': 'SE'},
  {'flag': '🇨🇭', 'code': '41', 'name': 'Switzerland', 'short': 'CH'},
  {'flag': '🇹🇷', 'code': '90', 'name': 'Turkey', 'short': 'TR'},
  {'flag': '🇦🇪', 'code': '971', 'name': 'United Arab Emirates', 'short': 'AE'},
  {'flag': '🇬🇧', 'code': '44', 'name': 'United Kingdom', 'short': 'GB'},
  {'flag': '🇺🇸', 'code': '1', 'name': 'United States', 'short': 'US'},
  {'flag': '🇻🇳', 'code': '84', 'name': 'Vietnam', 'short': 'VN'},
];

// واجهة اختيار رقم الهاتف
class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void showCountryPicker(BuildContext context) {
      context.read<CountryCubit>().resetFilter();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return BlocBuilder<CountryCubit, CountryState>(
            builder: (context, state) {
              return FractionallySizedBox(
                heightFactor: (screenHeight - 50) / screenHeight,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).ChooseCountryCode,
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.close,
                                size: screenWidth * 0.05, color: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      SizedBox(
                        height: screenWidth * 0.12,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xffFAFAFA),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xffE9E9E9)),
                          ),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: S.of(context).SearchForCountries,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: screenWidth * 0.035),
                              prefixIcon: Icon(Icons.search_outlined,
                                  color: Colors.grey, size: screenWidth * 0.05),
                            ),
                            onChanged: (query) =>
                                context.read<CountryCubit>().filterCountries(query),
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Expanded(
                        child: state.filteredCountries.isEmpty
                            ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('Assets/file.png',
                                  width: screenWidth * 0.3,
                                  color: const Color(0xffd8dfea)),
                              const SizedBox(height: 20),
                              Text(S.of(context).NoResultstoShow,
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                            : ListView.builder(
                          itemCount: state.filteredCountries.length,
                          itemBuilder: (context, index) {
                            var country = state.filteredCountries[index];
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(country['flag']!,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                    child: Text(
                                      country['code']!,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      country['name']!,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                context.read<CountryCubit>().selectCountry(country);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
                    color: Colors.grey,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500),
                children: const [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.04, right: screenWidth * 0.02),
                        child: Row(
                          children: [
                            Text(state.selectedCountryShort,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold)),
                            Icon(Icons.keyboard_arrow_down,
                                size: screenWidth * 0.05,
                                color: Colors.grey.shade500),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: screenWidth * 0.1,
                        width: 1.0,
                        color: Colors.grey.shade300),
                    SizedBox(width: screenWidth * 0.02),
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