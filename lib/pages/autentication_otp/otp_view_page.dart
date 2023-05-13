import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../main.dart';
import '../../providers/Voto_Provider.dart';
import '../../utils/Appcolors.dart';
import 'components/TextSizes.dart';
import 'components/app_colors.dart';
import 'components/test_style.dart';

class PhoneAuthPage  extends StatefulWidget {
  final ElectionId;

  const PhoneAuthPage({super.key, required this.ElectionId});
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();

}

class _PhoneAuthPageState extends State<PhoneAuthPage>{
  VotoProvider votoProvider =  new VotoProvider();
  bool isVisible = true;
  bool isResentOn = true;
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Appcolors.whitecolor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child:  Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 200,
                        child: Image.asset('Assets/images/otp.png'),
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
                    const SizedBox(
                      height: 10,
                    ),
                    _buildOtpTextField(),
                    const SizedBox(
                      height: 10,
                    ),
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
                          print(smsCode);
                          votoProvider.autenticarOTP(localStorage.get('codigo').toString(), widget.ElectionId, smsCode, context);

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
        );
  }




  Widget _buildOtpTextField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery
          .of(context)
          .size
          .width,
      fieldWidth: 40,
      fieldStyle: FieldStyle.box,
      otpFieldStyle: OtpFieldStyle(

      ),
      style: TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }
  buildBottompart() {

  }


}

class ApptextWidget extends StatelessWidget {
  String value;
  FontWeight textweightt;
  double fontsize;
  Color textcolor;
  ApptextWidget(
      {super.key,
        required this.fontsize,
        required this.textcolor,
        required this.textweightt,
        required this.value});

  @override
  Widget build(BuildContext context) {
    return buildTextWidget(value, textweightt, fontsize, textcolor);
  }

  buildTextWidget(
      String value, FontWeight textweightt, double fontsize, Color textcolor) {
    return Text(
      value,
      style: TextStyle(
          fontWeight: textweightt, fontSize: fontsize, color: textcolor),
    );
  }
}

