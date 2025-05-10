import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utiles/AppBar.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class ContactCubit extends Cubit<Map<String, String>> {
  ContactCubit()
      : super({
    "name": "Mahmoud",
    "phone": "01017900067",
    "message": "",
  });

  void updateField(String key, String value) {
    emit({...state, key: value});
  }
}

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _messageController = TextEditingController();
  double _messageFieldHeight = 0.3; // Initial height as fraction of screenWidth

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_updateMessageFieldHeight);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _updateMessageFieldHeight() {
    final text = _messageController.text;
    final lineCount = '\n'.allMatches(text).length + 1;
    setState(() {
      _messageFieldHeight = lineCount > 3 || text.length > 100
          ? 0.5 // Larger height for big messages
          : 0.3; // Default height
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: S.of(context).contactUs,
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
              BlocBuilder<ContactCubit, Map<String, String>>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _buildTextField(
                          context, S.of(context).name, 'name', state['name'] ?? ''),
                      SizedBox(height: screenWidth * 0.02),
                      _buildTextField(context, S.of(context).PhoneNumber, 'phone',
                          state['phone'] ?? ''),
                    ],
                  );
                },
              ),
              SizedBox(height: screenWidth * 0.05),
              Text(
                S.of(context).SendMessage,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              BlocBuilder<ContactCubit, Map<String, String>>(
                builder: (context, state) {
                  return Container(
                    height: screenWidth * _messageFieldHeight,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffE9E9E9), width: 1.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _messageController,
                      maxLines: null,
                      onChanged: (value) =>
                          context.read<ContactCubit>().updateField("message", value),
                      decoration: InputDecoration(
                        hintText: S.of(context).WriteMessage,
                        hintStyle: TextStyle(
                          color: SubText,
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
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
                  print("Phone: ${contactInfo['phone']}");
                  print("Message: ${contactInfo['message']}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
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
                        fontSize: screenWidth * 0.035,
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
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' * ',
                style: TextStyle(
                  color: SecondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
            : Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
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
                fontSize: screenWidth * 0.03,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                context.read<ContactCubit>().updateField(key, value);
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
            ),
          ),
        ),
      ],
    );
  }
}