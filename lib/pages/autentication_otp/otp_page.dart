import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:votum/providers/Voto_Provider.dart';

import '../../main.dart';
import 'components/TextSizes.dart';
import 'components/app_colors.dart';
import 'components/otp_field.dart';
import 'components/test_style.dart';

class OtpVerificationView extends StatefulWidget {

  final ElectionId;

  const OtpVerificationView({super.key, required this.ElectionId});
  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  Widget build(BuildContext context) {
    final OtpValue = null;
    VotoProvider votoProvider =  new VotoProvider();
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    bool isVisible = true;
    bool isResentOn = true;
    var otpValue = null;
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
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizes.kHeight30,
                      Text(
                        "Código de verificación",
                        style: GoogleFonts.poppins(
                          fontSize: 22*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xff3f468f),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 180,
                          child: Image.asset("Assets/images/email.png"),
                        ),
                      ),
                      Text(
                        "Ingrese el código que le enviamos\nen su correo",
                        style: GoogleFonts.poppins(
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5*ffem/fem,
                          color: Color(0xff979797),
                        ),
                      ),
                      AppSizes.kHeight30,
                      OtpTextField(
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
                        otpValue = verificationCode;
                      },
                  ),
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
                                    setState(() {
                                      isVisible = true;
                                      isResentOn = true;
                                    });
                                    print(isVisible);
                                    votoProvider.enviarOTP(localStorage.get('codigo').toString(), widget.ElectionId, context);
                                  },
                                  child:  Text(
                                    "Resend ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 19*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5*ffem/fem,
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
                                  style: GoogleFonts.poppins(
                                    fontSize: 19*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff000000),
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
                            votoProvider.autenticarOTP(localStorage.get('codigo').toString(), widget.ElectionId, otpValue, context);

                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:Color(0xff3f468f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10*fem),
                            ),
                            shadowColor:Color(0x3f000000),
                          ),
                          child:
                          Text(
                            'Enviar voto',
                            style: GoogleFonts.poppins(
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
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