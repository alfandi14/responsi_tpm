import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpm_responsi/theme/theme.dart';
import 'package:tpm_responsi/views/homePage/homePage.dart';
import 'package:tpm_responsi/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? email = '';
  String? password = '';
  bool? status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        body: SingleChildScrollView(
          child: Container(
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
                        "Login",
                        style: titleTextStyle.copyWith(fontSize: 40),
                      ),
                      Text("Login to your account", style: subTitleTextStyle),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: basicMargin.copyWith(top: 40, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      ElevatedButton(
                        onPressed: () {
                          getCredential();
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Login",
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
                      CustomButton(
                        text: "SignUp",
                        route: '/signup',
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  getCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      status = sharedPreferences.getBool("status");
      if (status == false) {
        setState(() {
          email = sharedPreferences.getString("email");
          password = sharedPreferences.getString("password");
          debugPrint(password);
        });
        if (email == _emailController.text &&
            password == _passwordController.text) {
          setState(() {
            debugPrint("text: ${_emailController.text}");
            sharedPreferences.setBool("status", true);
            status = sharedPreferences.getBool("status");
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Login Failed"),
                  content: const Text("Username or Password is wrong"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"))
                  ],
                );
              });
        }
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    });
  }
}
