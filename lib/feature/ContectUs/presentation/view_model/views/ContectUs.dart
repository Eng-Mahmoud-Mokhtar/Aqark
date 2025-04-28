import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class ContactCubit extends Cubit<Map<String, String>> {
  ContactCubit()
      : super({
    "name": "Mahmoud",
    "email": "Mahmoud@gmail.com",
    "phone": "01017900067",
    "message": "",
  });

  void updateField(String key, String value) {
    emit({...state, key: value});
  }
}

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => ContactCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: screenWidth * 0.1,
          leading: Padding(
            padding: EdgeInsets.only(left:screenHeight * 0.02),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: screenHeight * 0.03,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            S.of(context).contactUs,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.5),
            child: Container(
              color: const Color(0xffE9E9E9),
              height: 1.5,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AssetsData.Logo,
                    width: screenWidth * 0.3,
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),
                BlocBuilder<ContactCubit, Map<String, String>>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        buildTextField(context, S.of(context).name, "name"),
                        SizedBox(height: screenWidth * 0.03),
                        buildTextField(context, S.of(context).email, "email"),
                        SizedBox(height: screenWidth * 0.03),
                        buildTextField(context, S.of(context).PhoneNumber, "phone"),
                      ],
                    );
                  },
                ),
                SizedBox(height: screenWidth * 0.05),
                Text(
                    S.of(context).SendMessage,
                      style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold)
                  ),
                SizedBox(height: 6.h),
                BlocBuilder<ContactCubit, Map<String, String>>(
                  builder: (context, state) {
                    return Container(
                      height: screenWidth * 0.3,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Color(0xffE9E9E9), width: 1.0),
                      ),
                      child: TextField(
                        maxLines: null,
                        onChanged: (value) =>
                            context.read<ContactCubit>().updateField("message", value),
                        decoration: InputDecoration(
                          hintText: S.of(context).WriteMessage,
                          hintStyle: TextStyle(
                              color: SubText,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2F2F2F),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    final contactInfo = context.read<ContactCubit>().state;
                    print("Name: ${contactInfo['name']}");
                    print("Email: ${contactInfo['email']}");
                    print("Phone: ${contactInfo['phone']}");
                    print("Message: ${contactInfo['message']}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.12,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        S.of(context).Send,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextField(BuildContext context, String label, String fieldKey) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ContactCubit, Map<String, String>>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
                style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold)
            ),
            SizedBox(height: screenWidth * 0.015),
            Container(
              height: screenWidth * 0.12,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE9E9E9)),
              ),
              child: TextField(
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold
                ),
                controller: TextEditingController(text: state[fieldKey]),
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: screenWidth * 0.045),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
