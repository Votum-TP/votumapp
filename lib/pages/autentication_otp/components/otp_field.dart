import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:votum/providers/Voto_Provider.dart';

import 'app_colors.dart';

class OtpTextfieldWidget extends StatelessWidget {
  const OtpTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    VotoProvider voto = new VotoProvider();
    return OtpTextField(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      numberOfFields: 6,
      fieldWidth: 45,
      borderColor: AppColors.kButtonColor,
      focusedBorderColor: AppColors.kButtonColor,
      cursorColor: AppColors.lightBlackColor,
      onCodeChanged: (String code) {
        //Provider.of<FirebaseAuthViewModel>(context, listen: false).setOtp(code);
      },
      onSubmit: (String verificationCode) {
        //Provider.of<FirebaseAuthViewModel>(context, listen: false)
          //  .setOtp(verificationCode);
      },
    );
  }
}