import 'package:flutter/material.dart';
import 'package:janta_bike/myhomepage.dart';
import 'package:janta_bike/ui/color.dart';
import 'package:janta_bike/ui/custom.dart';
import 'package:flutter/services.dart'; // For regex
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for text fields
  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  String initialCountry='IN';
  PhoneNumber number= PhoneNumber(isoCode: 'IN');

  // Personal Info Controllers

  final _formKey = GlobalKey<FormState>(); // Form key to validate fields

  int currentIndex = 0; // Track the current section

  void nextSection() {
    if (_formKey.currentState!.validate()) {
      // If form is valid, go to the next section
      setState(() {
        if (currentIndex < 1) {
          currentIndex++;
        } else {
          // On the last section, handle submission
          _submitForm();
        }
      });
    }
  }

  void previousSection() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent the container from moving
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey, // Assign the form key here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNumberBox(0, '1', currentIndex >= 0),
                      _buildConnectingLine(0),
                      _buildNumberBox(1, '2', currentIndex >= 1),

                    ],
                  ),
                  SizedBox(height: 20),

                  // Content for each section
                  if (currentIndex == 0)
                    ...[
                      Text(
                        'Enter Contact Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      _buildTextFormField(
                        controller: phoneController,
                        label: 'Phone Number',
                        hintText: 'Enter your phone number',
                        keyboardType: TextInputType.phone,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          final phoneRegExp = RegExp(r'^(?:\+91)?[6-9][0-9]{9}$'); // Validate phone number format
                          if (!phoneRegExp.hasMatch(value)) {
                            return 'Enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: 'Next',
                        onPressed: nextSection,
                      ),

                    ] else if (currentIndex == 1) ...[
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 4; i++)
                          _buildOtpTextField(otpControllers[i], i),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Verify',
                      onPressed: nextSection,
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberBox(int index, String text, bool isCompleted) {
    return Container(
      width: 40, // Adjusted size for all boxes
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCompleted ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: isCompleted ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildConnectingLine(int index) {
    return Container(
      height: 2,
      width: 50,
      color: currentIndex > index ? Colors.blue : Colors.grey[300],
    );
  }

  Widget _buildOtpTextField(TextEditingController controller, int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
          fontSize: 24, // Adjust the font size for better visibility
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '', // Hide the character count
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < otpControllers.length - 1) {
            FocusScope.of(context).nextFocus(); // Move to next field
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus(); // Move to previous field
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter OTP';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required TextInputType keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
