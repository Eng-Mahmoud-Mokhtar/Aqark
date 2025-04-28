import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';

class CodeCubit extends Cubit<List<TextEditingController>> {
  CodeCubit() : super(List.generate(6, (index) => TextEditingController()));

  void updateControllers() {
    emit(List.generate(6, (index) => TextEditingController()));
  }
}

class Code extends StatelessWidget {
  const Code({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodeCubit(),
      child: BlocBuilder<CodeCubit, List<TextEditingController>>(
        builder: (context, controllers) {
          return LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double fieldSize = screenWidth * 0.14;
              double separatorSize = screenWidth * 0.04;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return Row(
                        children: [
                          if (index == 3)
                            Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.015),
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: separatorSize,
                                  fontWeight: FontWeight.bold,
                                  color: SubText,
                                ),
                              ),
                            ),
                          SizedBox(
                            width: fieldSize,
                            height: fieldSize,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: KprimaryColor.withOpacity(0.08),
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.blue.withOpacity(0.1),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: KprimaryColor.withOpacity(0.08),
                                  ),
                                ),
                              ),
                              controller: controllers[index],
                              onChanged: (value) {
                                if (value.isNotEmpty && index < controllers.length - 1) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
