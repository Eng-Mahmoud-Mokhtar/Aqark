import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Design&Finishing/presentation/view_model/views/Design&Finishing.dart';
import '../../../../../Materials/presentation/view_model/views/Materials.dart';
import '../../../../../Real estates/presentation/view_model/views/RealEstateCategories.dart';
import 'FeatureContainer.dart';
import 'buildBrandsRow.dart';
import 'buildImages.dart';
import 'buildSearchBar.dart';
import 'buildUserProfile.dart';

abstract class BodyHomeState {}

class BodyHomeInitial extends BodyHomeState {}

class BodyHomeLoading extends BodyHomeState {}

class BodyHomeLoaded extends BodyHomeState {
  final List<String> homeImages;
  final List<String> serviceImages;
  BodyHomeLoaded({required this.homeImages, required this.serviceImages});
}

class BodyHomeCubit extends Cubit<BodyHomeState> {
  BodyHomeCubit() : super(BodyHomeInitial());

  void loadData() async {
    emit(BodyHomeLoading());
    await Future.delayed(const Duration(seconds: 2));


    final List<String> serviceImages = [
      'Assets/property.png',
      'Assets/wheel-barrow.png',
      'Assets/stationery.png',
          'Assets/feature (1).png',
    ];

    emit(BodyHomeLoaded(homeImages: homeImages, serviceImages: serviceImages));
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BodyHomeCubit()..loadData(),
      child: BlocBuilder<BodyHomeCubit, BodyHomeState>(
        builder: (context, state) {
          if (state is BodyHomeLoading) {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(KprimaryColor),
                ),
              ),
            );
          } else if (state is BodyHomeLoaded) {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildUserProfile(context),
                      const SizedBox(height: 12),
                      Divider(color: KprimaryColor.withOpacity(0.1), thickness: 1, height: 1),
                      const SizedBox(height: 12),
                      buildBrandsRow(context),
                      buildSearchBar(context),
                      const SizedBox(height: 12),
                      AnimatedImageSlider(images: state.homeImages),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).Services,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RealEstateCategories()));
                                  break;
                                case 1:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Materials()));
                                  break;
                                case 2:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DesignFinishing()));
                                  break;
                                case 3:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GovernmentOperations()));
                                  break;
                              }
                            },
                            child: FeatureContainer(
                              label: index == 0
                                  ? S.of(context).RealEstate
                                  : index == 1
                                  ? S.of(context).Materials
                                  : index == 2
                                  ? S.of(context).Design_Finishing
                                  : S.of(context).Government_Services,
                              imagePath: state.serviceImages[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}


class GovernmentOperations extends StatelessWidget {
  const GovernmentOperations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {
        'title': 'التمويل العقاري',
        'subSections': [
          {
            'title': 'بنك الإسكان والتعمير',
            'page': GovernmentDetails(
              title: 'بنك الإسكان والتعمير',
              services: [
                'تمويل شراء وحدات سكنية',
                'تمويل بناء الوحدات السكنية',
                'قروض بفائدة مخفضة للمواطنين',
              ],
              requirements: [
                'صورة بطاقة الرقم القومي',
                'كشف حساب بنكي لآخر 6 أشهر',
                'عقد العمل أو شهادة الدخل',
              ],
            ),
          },
          {
            'title': 'البنك العقاري المصري',
            'page': GovernmentDetails(
              title: 'البنك العقاري المصري',
              services: [
                'تمويل شراء العقارات',
                'قروض لتجديد الوحدات السكنية',
                'تمويل المشروعات الصغيرة',
              ],
              requirements: [
                'صورة بطاقة الرقم القومي',
                'عقد الملكية أو الإيجار',
                'كشف حساب بنكي حديث',
              ],
            ),
          },
          {
            'title': 'بنك مصر',
            'page': GovernmentDetails(
              title: 'بنك مصر',
              services: [
                'تمويل شراء العقارات',
                'قروض لتجديد الوحدات السكنية',
                'تمويل المشروعات الصغيرة',
              ],
              requirements: [
                'صورة بطاقة الرقم القومي',
                'عقد الملكية أو الإيجار',
                'كشف حساب بنكي حديث',
              ],
            ),
          },
          {
            'title': 'البنك الأهلي المصري',
            'page': GovernmentDetails(
              title: 'البنك الأهلي المصري',
              services: [
                'تمويل شراء العقارات',
                'قروض لتجديد الوحدات السكنية',
                'تمويل المشروعات الصغيرة',
              ],
              requirements: [
                'صورة بطاقة الرقم القومي',
                'عقد الملكية أو الإيجار',
                'كشف حساب بنكي حديث',
              ],
            ),
          },
        ],
      },
      {
        'title': 'التراخيص',
        'subSections': [
          {
            'title': 'تراخيص البناء',
            'page': GovernmentDetails(
              title: 'تراخيص البناء',
              services: [
                'إصدار تراخيص بناء جديدة',
                'تجديد تراخيص البناء',
                'تعديل تراخيص البناء',
              ],
              requirements: [
                'مخططات معتمدة من المهندس',
                'صورة من عقد الملكية',
                'موافقة الجهات المعنية',
              ],
            ),
          },
          {
            'title': 'تراخيص التشغيل',
            'page': GovernmentDetails(
              title: 'تراخيص التشغيل',
              services: [
                'تراخيص تشغيل الوحدات السكنية',
                'تراخيص تشغيل المحال التجارية',
                'تراخيص تشغيل المنشآت الصناعية',
              ],
              requirements: [
                'شهادة السلامة المهنية',
                'عقد الملكية أو الإيجار',
                'موافقة الدفاع المدني',
              ],
            ),
          },
        ],
      },
      {
        'title': 'الضرائب العقارية',
        'subSections': [
          {
            'title': 'ضريبة القيمة المضافة',
            'page': GovernmentDetails(
              title: 'ضريبة القيمة المضافة',
              services: [
                'تسجيل العقارات الخاضعة للضريبة',
                'تقديم الإقرارات الضريبية',
                'سداد الضرائب المستحقة',
              ],
              requirements: [
                'عقد البيع أو الشراء',
                'صورة من السجل التجاري',
                'كشف حساب ضريبي',
              ],
            ),
          },
          {
            'title': 'ضريبة الأملاك',
            'page': GovernmentDetails(
              title: 'ضريبة الأملاك',
              services: [
                'تقييم العقارات الخاضعة للضريبة',
                'تقديم الإقرارات الضريبية',
                'سداد الضرائب السنوية',
              ],
              requirements: [
                'عقد الملكية',
                'صورة من الرقم القومي',
                'كشف حساب ضريبي',
              ],
            ),
          },
        ],
      },
      {
        'title': 'التخليصات',
        'subSections': [
          {
            'title': 'تخليص المستندات',
            'page': GovernmentDetails(
              title: 'تخليص المستندات',
              services: [
                'تخليص عقود البيع والشراء',
                'تخليص عقود الإيجار',
                'تخليص المستندات القانونية',
              ],
              requirements: [
                'صورة من عقد الملكية',
                'صورة من الرقم القومي',
                'إيصال سداد الرسوم',
              ],
            ),
          },
          {
            'title': 'تخليص المعاملات',
            'page': GovernmentDetails(
              title: 'تخليص المعاملات',
              services: [
                'تخليص معاملات التسجيل',
                'تخليص معاملات التقييم',
                'تخليص معاملات التحويل',
              ],
              requirements: [
                'عقد البيع أو الشراء',
                'صورة من السجل التجاري',
                'إيصال سداد الرسوم',
              ],
            ),
          },
        ],
      },
      {
        'title': 'المصالحات',
        'subSections': [
          {
            'title': 'تسوية المنازعات العقارية',
            'page': GovernmentDetails(
              title: 'تسوية المنازعات العقارية',
              services: [
                'تسوية النزاعات بين الملاك والمستأجرين',
                'تسوية النزاعات بين المطورين والملاك',
                'تسوية النزاعات القانونية المتعلقة بالعقارات',
              ],
              requirements: [
                'عقد الملكية أو الإيجار',
                'صورة من الرقم القومي',
                'مستندات النزاع القانونية',
              ],
            ),
          },
          {
            'title': 'تسوية المخالفات البنائية',
            'page': GovernmentDetails(
              title: 'تسوية المخالفات البنائية',
              services: [
                'تسوية مخالفات البناء غير المرخصة',
                'تسوية مخالفات التعدي على أملاك الدولة',
                'تسوية مخالفات التقسيم غير القانوني',
              ],
              requirements: [
                'مخططات المبنى',
                'صورة من عقد الملكية',
                'إيصال سداد الغرامات',
              ],
            ),
          },
          {
            'title': 'تسوية الضرائب المتأخرة',
            'page': GovernmentDetails(
              title: 'تسوية الضرائب المتأخرة',
              services: [
                'تسوية الضرائب العقارية المتأخرة',
                'تسوية ضريبة القيمة المضافة المتأخرة',
                'تسوية الضرائب الجمركية المتأخرة',
              ],
              requirements: [
                'كشف الحساب الضريبي',
                'صورة من الرقم القومي',
                'إيصال سداد الضرائب',
              ],
            ),
          },
        ],
      },
      {
        'title': 'التسجيلات العقارية',
        'subSections': [
          {
            'title': 'تسجيل العقارات',
            'page': GovernmentDetails(
              title: 'تسجيل العقارات',
              services: [
                'تسجيل العقارات الجديدة',
                'تسجيل نقل الملكية',
                'تسجيل الرهن العقاري',
              ],
              requirements: [
                'عقد البيع أو الشراء',
                'صورة من الرقم القومي',
                'إيصال سداد الرسوم',
              ],
            ),
          },
          {
            'title': 'تسجيل الرهن العقاري',
            'page': GovernmentDetails(
              title: 'تسجيل الرهن العقاري',
              services: [
                'تسجيل الرهن العقاري',
                'إلغاء تسجيل الرهن العقاري',
                'تعديل تسجيل الرهن العقاري',
              ],
              requirements: [
                'عقد الرهن العقاري',
                'صورة من الرقم القومي',
                'إيصال سداد الرسوم',
              ],
            ),
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('المصالح الحكومية العقارية'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                sections[index]['title'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              children: (sections[index]['subSections'] as List<Map<String, dynamic>>)
                  .map((subSection) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => subSection['page']),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    subSection['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
class GovernmentDetails extends StatelessWidget {
  final String title;
  final List<String> services;
  final List<String> requirements;

  const GovernmentDetails({
    super.key,
    required this.title,
    required this.services,
    required this.requirements,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الخدمات:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ...services.map((service) => Text('- $service')).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الأوراق المطلوبة:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ...requirements.map((req) => Text('- $req')).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

