import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class InteriorDesign extends StatefulWidget {
  const InteriorDesign({Key? key}) : super(key: key);

  @override
  _InteriorDesignState createState() => _InteriorDesignState();
}

class _InteriorDesignState extends State<InteriorDesign> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _areaController = TextEditingController();
  final _landAreaController = TextEditingController();
  final _buildingAreaController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedPlaceType;
  String? _selectedFileName;

  final List<String> _placeTypes = [
    'Living Room',
    'Bedroom',
    'Kitchen',
    'Bathroom',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _areaController.dispose();
    _landAreaController.dispose();
    _buildingAreaController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).RequestSubmittedSuccessfully,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: KprimaryColor,
          duration: const Duration(seconds: 3),
        ),
      );
      _resetForm();
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _phoneController.clear();
    _areaController.clear();
    _landAreaController.clear();
    _buildingAreaController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedPlaceType = null;
      _selectedFileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title:  S.of(context).InteriorDesign,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: S.of(context).name,
                  hint:  S.of(context).EnterYourName,
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).PleaseEnterYourName;
                    }
                    return null;
                  },
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenWidth * 0.03),
                _buildTextField(
                  controller: _phoneController,
                  label: S.of(context).PhoneNumber,
                  hint: S.of(context).PhoneNumber,
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return  S.of(context).PleaseEnterYourPhoneNumber;
                    }
                    if (value.length < 0) {
                      return  S.of(context).InvalidPhoneNumber;
                    }
                    return null;
                  },
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenWidth * 0.03),
                _buildDropdownField(
                  label:  S.of(context).PlaceType,
                  hint:  S.of(context).SelectType,
                  value: _selectedPlaceType,
                  items: _placeTypes,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlaceType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return  S.of(context).PleaseSelectAPlaceType;
                    }
                    return null;
                  },
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenWidth * 0.03),
                _buildTextField(
                  controller: _areaController,
                  label:  S.of(context).TotalArea,
                  hint: S.of(context).TotalArea,
                  imagePath: 'Assets/icons8-enlarge-30.png',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    SquareMeterInputFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).PleaseEnterTotalArea;
                    }
                    final cleanValue = value.replaceAll(' m²', '');
                    final numValue = int.tryParse(cleanValue);
                    if (numValue == null || numValue <= 0) {
                      return S.of(context).InvalidTotalArea;
                    }
                    if (numValue > 99999) {
                      return 'Max 99999';
                    }
                    return null;
                  },
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenWidth * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _landAreaController,
                        label:S.of(context).LandArea,
                        hint: S.of(context).LandArea,
                        icon: Icons.crop_square_outlined,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          SquareMeterInputFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).PleaseEnterLandArea;
                          }
                          final cleanValue = value.replaceAll(' m²', '');
                          final numValue = int.tryParse(cleanValue);
                          if (numValue == null || numValue <= 0) {
                            return S.of(context).InvalidLandArea;
                          }
                          if (numValue > 99999) {
                            return 'Max 99999';
                          }
                          return null;
                        },
                        screenWidth: screenWidth,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: _buildTextField(
                        controller: _buildingAreaController,
                        label: S.of(context).BuildingArea,
                        hint:  S.of(context).BuildingArea,
                        imagePath: 'Assets/icons8-home-32.png',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          SquareMeterInputFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return  S.of(context).PleaseEnterBuildingArea;
                          }
                          final cleanValue = value.replaceAll(' m²', '');
                          final numValue = int.tryParse(cleanValue);
                          if (numValue == null || numValue <= 0) {
                            return  S.of(context).InvalidBuildingArea;
                          }
                          if (numValue > 99999) {
                            return 'Max 99999';
                          }
                          return null;
                        },
                        screenWidth: screenWidth,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.03),
                _buildTextField(
                  controller: _descriptionController,
                  label:  S.of(context).Description,
                  hint: S.of(context).Description ,
                  maxLines: 5,
                  minLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return  S.of(context).PleaseEnterADescription;
                    }
                    return null;
                  },
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenWidth * 0.05),
                _buildFilePickerField(screenWidth),
                SizedBox(height: screenWidth * 0.05),
                _buildButtons(screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? icon,
    String? imagePath,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int maxLines = 1,
    int? minLines,
    required double screenWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryColor,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        FormField<String>(
          validator: validator,
          builder: (formFieldState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: formFieldState.hasError
                          ? Colors.red[700]!
                          : const Color(0xffE9E9E9),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    maxLines: maxLines,
                    minLines: minLines,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                      prefixIcon: imagePath != null
                          ? Padding(
                        padding: EdgeInsets.symmetric(vertical:screenWidth * 0.04),
                        child: Image.asset(
                          imagePath,
                          height: screenWidth * 0.03,
                          fit: BoxFit.contain,
                          color: KprimaryColor,
                        ),
                      )
                          : icon != null
                          ? Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Icon(icon, color: KprimaryColor, size: screenWidth * 0.05),
                          )
                          : null,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.04,
                        horizontal: screenWidth * 0.03,
                      ),
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorStyle: TextStyle(height: 0),
                    ),
                    onChanged: (value) {
                      if (formFieldState.hasError) {
                        formFieldState.didChange(value);
                      }
                    },
                  ),
                ),
                if (formFieldState.hasError)
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenWidth * 0.01,
                      left: screenWidth * 0.02,
                    ),
                    child: Text(
                      formFieldState.errorText!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?)? validator,
    required double screenWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryColor,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.ltr,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
            prefixIcon: Icon(
              Icons.roofing_rounded,
              color: KprimaryColor,
              size: screenWidth * 0.05,
            ),
            filled: true,
            fillColor: const Color(0xffFAFAFA),
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.03,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffE9E9E9)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: KprimaryColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[700]!, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[700]!, width: 1.5),
            ),
            errorStyle: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
          ),
          dropdownColor: Colors.white,
          icon: Icon(
            Icons.arrow_drop_down,
            color: KprimaryColor,
            size: screenWidth * 0.035,
          ),
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFilePickerField(double screenWidth) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, screenWidth * 0.12),
        backgroundColor: Colors.red[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      onPressed: _pickFile,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.upload_file,
              color: Colors.white,
              size: screenWidth * 0.05,
            ),
            SizedBox(width: screenWidth * 0.03),
            Flexible(
              child: Text(
                _selectedFileName ?? S.of(context).UploadFile,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(double screenWidth) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, screenWidth * 0.12),
              backgroundColor: KprimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
            ),
            onPressed: _submitForm,
            child: Text(
              S.of(context).submitRequestButton,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, screenWidth * 0.12),
              backgroundColor: Colors.white,
              side: BorderSide(color: KprimaryColor, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
            ),
            onPressed: _resetForm,
            child: Text(
              S.of(context).Reset,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: KprimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SquareMeterInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    newText = newText.replaceAll(' m²', '');
    if (newText.isEmpty || RegExp(r'^\d{1,5}$').hasMatch(newText)) {
      newText = newText.isNotEmpty ? '$newText m²' : newText;
      int cursorPosition = newValue.selection.baseOffset;
      if (cursorPosition > newText.length) {
        cursorPosition = newText.length;
      } else if (oldValue.text.endsWith(' m²') &&
          newValue.text.length > oldValue.text.length) {
        cursorPosition = newText.length - 3;
      }

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPosition),
      );
    }
    return oldValue;
  }
}