import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'Widget/ListEx.dart';
import 'Widget/RealStateObjects.dart';
import 'Widget/buildApartmentItem.dart';

// Cubit for managing apartments state
class ApartmentsCubit extends Cubit<String> {
  ApartmentsCubit(context) : super(S.of(context).all);

  void selectType(String type) => emit(type);
}

class AllApartments extends StatelessWidget {
  final List<RealStateObjects> apartments;

  const AllApartments({super.key, required this.apartments});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final apartmentTypes = [
      S.of(context).all,
      S.of(context).rent,
      S.of(context).sale,
      S.of(context).villas,
      S.of(context).apartments,
      S.of(context).offices,
    ];

    return BlocProvider(
      create: (_) => ApartmentsCubit(context),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: S.of(context).Properties,
          onBack: () => Navigator.pop(context),
          showSearch: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: screenWidth * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: apartmentTypes.length,
                  itemBuilder: (context, index) {
                    final type = apartmentTypes[index];
                    return BlocBuilder<ApartmentsCubit, String>(
                      builder: (context, selectedType) {
                        return GestureDetector(
                          onTap: () =>
                              context.read<ApartmentsCubit>().selectType(type),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Localizations.localeOf(context).languageCode == 'ar' ? screenWidth * 0.02 : 0,
                              right: Localizations.localeOf(context).languageCode == 'ar' ? 0 : screenWidth * 0.02,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenWidth * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: selectedType == type
                                  ? KprimaryColor
                                  : KprimaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: selectedType == type
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: BlocBuilder<ApartmentsCubit, String>(
                  builder: (context, selectedType) {
                    final displayedApartments =
                    apartments.isNotEmpty ? apartments : defaultApartments;

                    final filteredApartments = displayedApartments.where(
                          (apartment) {
                        if (selectedType == S.of(context).all) {
                          return true;
                        } else if (selectedType == S.of(context).rent) {
                          return apartment.isForRent;
                        } else if (selectedType == S.of(context).sale) {
                          return !apartment.isForRent;
                        } else {
                          return apartment.type == selectedType;
                        }
                      },
                    ).toList();

                    return filteredApartments.isEmpty
                        ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Assets/file.png',
                            width: screenWidth * 0.3,
                            color: KprimaryColor.withOpacity(0.08),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            S.of(context).no_results,
                            style: TextStyle(
                              color: const Color(0xff2F2F2F),
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                        : ListView.builder(
                      itemCount: filteredApartments.length,
                      itemBuilder: (context, index) {
                        final apartment = filteredApartments[index];
                        return Padding(
                          padding:
                          EdgeInsets.only(bottom: screenHeight * 0.02),
                          child: buildApartmentItem(context, apartment),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
