import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class EditProfileCubit extends Cubit<Map<String, String>> {
  EditProfileCubit()
      : super({
          'name': 'Mahmoud',
          'email': 'Mahmoud@gmail.com',
          'phone': '01017900067',
        });

  void updateField(String key, String value) {
    emit({...state, key: value});
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).editProfile,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImage(screenWidth),
            SizedBox(height: screenWidth * 0.15),
            BlocBuilder<EditProfileCubit, Map<String, String>>(
              builder: (context, state) {
                return Column(
                  children: [
                    _buildTextField(
                        context, S.of(context).name, 'name', state['name'] ?? ''),
                    SizedBox(height: screenWidth * 0.02),
                    _buildTextField(
                        context, S.of(context).PhoneNumber, 'phone', state['phone'] ?? ''),
                  ],
                );
              },
            ),
            SizedBox(height: screenWidth * 0.05),
            _buildSaveCancelButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(double screenWidth) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG"),
            radius: screenWidth * 0.21,
            backgroundColor: Colors.grey.shade200,
          ),
          Positioned(
            right: 0.0,
            bottom: screenWidth * 0.05,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              width: screenWidth * 0.090,
              height: screenWidth * 0.090,
              child: Icon(
                Icons.mode_edit_outline_outlined,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, String label, String key, String hint) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        key == 'phone'
            ? RichText(
          text: TextSpan(
            text: S.of(context).PhoneNumber,
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
        )
            : Text(
          label,
          style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenWidth * 0.015),
        SizedBox(
          height: screenWidth * 0.12,
        child: DecoratedBox(
          decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffE9E9E9))),
          child: TextField(
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) {
              context.read<EditProfileCubit>().updateField(key, value);
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.035,
              horizontal: screenWidth * 0.02,
              ),
            hintText: hint,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(15),
            ],
          ),
        ),
        )
      ]
    );
  }

  Widget _buildSaveCancelButtons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: screenWidth * 0.12,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffE72929)),
                ),
                backgroundColor: backgroundColor,
              ),
              child: Center(
                child: Text(
                  S.of(context).cancel,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffE72929),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: screenWidth * 0.12,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: KprimaryColor,
              ),
              child: Text(
                S.of(context).save,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
