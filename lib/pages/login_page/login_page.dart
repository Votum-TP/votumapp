import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/animation/FadeAnimation.dart';
import 'package:votum/providers/UserProvider.dart';
import 'package:votum/widgets/Custom_drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? _codigoAlumno="";
  String? _password="";
  UserProvider uService = new UserProvider();
  TextEditingController loginPasswordController = new TextEditingController();
  bool _obscureTextLogin = true;
  final FocusNode myFocusNodePasswordLogin = FocusNode();
  _submit() async{
    final result = await uService.login(_codigoAlumno!, _password!);
    if(result != null && result.data != null && result.data?.code ==200) {
      Navigator.pushNamed(context, 'elections');
      //DIALOG
    } else {
      final message = result.errorMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        bottom: 120,
                        width: 220,
                        height: 290,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage('Assets/images/cedula.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        top: 130,
                        width: 170,
                        height: 240,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('Assets/images/votum.png')
                              )
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16.0,
                                    color: Colors.grey[400]),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 22.0,
                                  ),
                                  hintText: "Codigo de alumno",
                                  hintStyle: TextStyle(
                                      fontFamily: "Poppins", fontSize: 15.0),
                                ),
                                onChanged: (value) => setState(() => _codigoAlumno = value),
                                validator: (data) {
                                  if (data == null || data.isEmpty) {
                                    return 'Ingrese un correo';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                obscureText: _obscureTextLogin,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: loginPasswordController,
                                focusNode: myFocusNodePasswordLogin,
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.grey[400]),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.key,
                                    size: 22.0,
                                    color: Colors.black,
                                  ),
                                  hintText: "Contraseña",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold", fontSize: 15.0),
                                ),
                                onChanged: (value) => setState(() => _password = value),
                                validator: (data) {
                                  if (data == null || data.isEmpty) {
                                    return 'Ingrese una contraseña';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(height: 70,),
                      FadeAnimation(2, MaterialButton(

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                        color: Color(0xFF3F468F),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          this._submit();

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: Text(
                            "Ingresar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),),
                      SizedBox(height: 70,),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
