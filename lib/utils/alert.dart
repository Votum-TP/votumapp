import 'package:flutter/material.dart';

class Alert {


  void createAlert(
      BuildContext context, String cabezera, String body, String button_text) {
    showDialog(
        barrierColor: Color(0xff11a0d9).withOpacity(0.6),
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Padding(
                padding: EdgeInsets.only(top: 32),
                child: Center(
                    child: Text(cabezera,
                        style: TextStyle(
                            color: Color(0xff1f82bf),
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)))),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: SingleChildScrollView(
                          child: Text(body,
                              style: TextStyle(
                                  color: Color(0xff1d1d1b),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0),
                              textAlign: TextAlign.justify))),
                  Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 16.0),
                      child: default_button(context, button_text))
                ],
              ),
            ),
          );
        });
  }

  Widget default_button(BuildContext context, String text) {
    return MaterialButton(
        height: 36.0,
        minWidth: 126.0,
        color: Color(0xff11a0d9),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        child: Text(text,
            style: TextStyle(
                color:Color(0xff1d1d1b), fontWeight: FontWeight.w600)),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }
}