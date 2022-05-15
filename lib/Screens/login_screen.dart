import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigo_place/Screens/sign_up.dart';

import '../Constant/images.dart';
import '../Constant/validators.dart';
import '../Services/api_service.dart';
import 'Share/bottom_navigation.dart';
import 'Share/text_field.dart';
import 'news_feed.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool check = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Image.asset(vigoLogo),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromRGBO(209, 210, 216, 1)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  )),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Login to continue',
                        style: TextStyle(
                            fontSize: 19,
                            color: Color.fromRGBO(129, 53, 249, 1),
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 20),
                    SizedBox(
                      //height: 56,
                      width: MediaQuery.of(context).size.width,
                      child: VigoTextField(
                        controller: userNameController,
                        obScureText: false,
                        hintText: 'Username or email address',
                        validator: Validators().validateTextField,
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                        //Icon(icon: icons.person),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      //height: 56,
                      width: MediaQuery.of(context).size.width,
                      child: VigoTextField(
                          controller: passwordController,
                          obScureText: obscureText,
                          hintText: 'Password',
                          validator: Validators().validateTextField,
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: obscureText == true
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    ))
                          //Icon(icon: icons.person),
                          ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Checkbox(
                        value: check,
                        onChanged: (bool? value) {
                          setState(() {
                            check = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(129, 53, 249, 1),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.000, 0.7],
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(31, 241, 227, 0.5),
                              Color.fromRGBO(129, 53, 249, 0.8)
                            ],
                          )),
                      child: TextButton(
                          onPressed: () {
                            login();
                          },
                          child: value == false
                              ? Text(
                                  'Login',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                )
                              : const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      'OR LOGIN WITH',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(142, 143, 153, 1)),
                    )),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(facebook),
                        const SizedBox(width: 5),
                        Image.asset(google),
                        const SizedBox(width: 5),
                        Image.asset(apple),
                      ],
                    ),
                    const Spacer(),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                        text: 'Don’t have an account yet? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(129, 53, 249, 1),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                      ),
                    ])),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  var service = ApiService();
  bool value = false;
  loading() {
    setState(() {
      value = !value;
    });
  }

  login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      loading();
      service
          .loginPost(userNameController.text, passwordController.text)
          .then((value) {
        print(value['message']);
        if (value['flag'] == true) {
          if (check) {
            prefs.setBool('loggedIn', true);
          }
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value['message'])));
          loading();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavigation()),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value['message'])));
          loading();
          //print(value['message']);
        }
      });
    }
  }
}
