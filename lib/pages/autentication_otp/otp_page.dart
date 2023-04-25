import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'components/TextSizes.dart';
import 'components/app_colors.dart';
import 'components/otp_field.dart';
import 'components/test_style.dart';

class OtpVerificationView extends StatefulWidget {

  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    bool isResentOn = true;
    final otpValue = null;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },

        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizes.kHeight30,
                      Text(
                        "OTP Verification",
                        style: AppTextStyles.loginHeading,
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 180,
                          child: Image.asset("Assets/images/email.png"),
                        ),
                      ),
                      Text(
                        "Enter the verification code we just sent you\non mobile +91",
                        style: const TextStyle(
                          color: AppColors.lightBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSizes.kHeight30,
                      const OtpTextfieldWidget(),
                      AppSizes.kHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TweenAnimationBuilder(
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: const Duration(seconds: 30),
                            builder: (context, value, child) {
                              int seconds = (value * 30).ceil();
                              seconds = seconds % 60;
                              isResentOn = seconds <= 0;
                              return Visibility(
                                visible: isResentOn,
                                child: GestureDetector(
                                  onTap: () {
                                    /*context
                                        .read<FirebaseAuthViewModel>()
                                        .resentOTPtoPhone(context);*/
                                  },
                                  child: const Text(
                                    "Resend ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.kButtonColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          TweenAnimationBuilder(
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: const Duration(seconds: 30),
                            builder: (context, value, child) {
                              int seconds = (value * 30).ceil();
                              seconds = seconds % 60;
                              String formattedTime =
                              seconds.toString().padLeft(2, '0');
                              isVisible = seconds > 0;
                              return Visibility(
                                visible: isVisible,
                                child: Text(
                                  "Resend in $formattedTime",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      AppSizes.kHeight40,
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed:

                               () {
                            /*context
                                .read<FirebaseAuthViewModel>()
                                .firbaseAuthenticationWithOTP(context);*/
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                          ),
                          child:
                               const Text(
                            "Verify",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}