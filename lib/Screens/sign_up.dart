import 'package:date_field/date_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/images.dart';
import '../Constant/validators.dart';
import '../Services/api_service.dart';
import 'Share/bottom_navigation.dart';
import 'Share/text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;

  bool obscureText = true;
  bool obscureText1 = true;

  String? date;

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
            padding:
                const EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 3),
            child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(360),
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color.fromRGBO(209, 210, 216, 1)),
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Sign up to gain access',
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(129, 53, 249, 1),
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VigoTextField(
                      controller: nameController,
                      obScureText: false,
                      hintText: 'Full Name',
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      //Icon(icon: icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VigoTextField(
                      controller: userNameController,
                      obScureText: false,
                      hintText: 'User Name',
                      validator: Validators().validateTextField,
                      icon: const Icon(
                        Icons.alternate_email,
                        color: Colors.black,
                      ),
                      //Icon(icon: icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VigoTextField(
                      controller: emailController,
                      obScureText: false,
                      validator: Validators().validateEmail,
                      hintText: 'Email',
                      icon: const Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DateTimeField(
                    decoration: const InputDecoration(
                        isDense: true,
                        filled: true,
                        hintText: 'D.O.B',
                        fillColor: Color.fromRGBO(243, 244, 248, 1),
                        //icon: icon,
                        prefixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(129, 53, 249, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromRGBO(209, 210, 216, 1),
                        ))),
                    mode: DateTimeFieldPickerMode.date,
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDate = value;
                        //String date = selectedDate.toString();
                        date = '${selectedDate.toString().characters.take(10)}';
                        print(date);
                      });
                    },
                    selectedDate: selectedDate,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VigoTextField(
                        controller: passwordController,
                        obScureText: obscureText,
                        hintText: 'Password',
                        validator: Validators().validatePassword,
                        icon: const Icon(
                          Icons.lock_outline,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VigoTextField(
                        controller: confirmPasswordController,
                        obScureText: obscureText1,
                        hintText: 'Confirm password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value != passwordController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        icon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText1 = !obscureText1;
                              });
                            },
                            icon: obscureText1 == true
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                      Checkbox(
                        value: check,
                        onChanged: (bool? value) {
                          setState(() {
                            check = value!;
                          });
                        },
                      ),
                      //const SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(129, 53, 249, 1),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Single tapped.
                              },
                          ),
                          const TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(129, 53, 249, 1),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Single tapped.
                              },
                          ),
                        ])),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 3),
                  check == true
                      ? Container()
                      : const Text(
                          'Please accept the terms and conditions',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
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
                          register();
                        },
                        child: value == false
                            ? const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              )
                            : const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                      child: Text(
                    'OR SIGNUP WITH',
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
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: 'Have an account already? ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Login.',
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
                                  builder: (context) => LoginScreen()));
                        },
                    ),
                  ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool value = false;
  loading() {
    setState(() {
      value = !value;
    });
  }

  var service = ApiService();
  register() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate() && check == true) {
      print(userNameController.text);
      loading();
      service
          .registerPost(userNameController.text, emailController.text,
              nameController.text, date!, passwordController.text)
          .then((value) {
        print(value['message']);
        if (value['flag'] == true) {
          loading();
          prefs.setBool('loggedIn', true);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value['message'])));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavigation()),
              (route) => false);
        } else {
          loading();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value['message'])));
        }
      });
    }
  }
}
