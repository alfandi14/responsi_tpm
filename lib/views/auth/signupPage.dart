import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/theme.dart';
import '../../widgets/button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: loginMargin.copyWith(top: 150),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SignUp",
                      style: titleTextStyle.copyWith(fontSize: 40),
                    ),
                    Text("Register to made your account",
                        style: subTitleTextStyle),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: basicMargin.copyWith(top: 40, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Email",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              label: Text("Email"),
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: spaceSize,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Password",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              label: Text("Password"),
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                            controller: _passwordController,
                          ),
                          SizedBox(
                            height: spaceSize,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Name",
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              label: Text("Name"),
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: spaceSize,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _register(false);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Signup",
                                  textAlign: TextAlign.center,
                                )),
                            style: ElevatedButton.styleFrom(
                              primary: subColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              textStyle: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: spaceSize,
                          ),
                          Text(
                              "----------------------- Or -----------------------"),
                          SizedBox(
                            height: spaceSize,
                          ),
                          CustomButton(text: "Login", route: '/login'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _register(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = value;
    prefs.setBool('status', status);
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setString('name', _nameController.text);
    prefs.commit();

    print(prefs.getString('email'));
    print(prefs.getString('password'));
    print(prefs.getString('name'));
    print(prefs.getBool('status'));
  }
}
