import 'package:flutter/material.dart';

import '../Constant/images.dart';
import 'Share/text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(vigoLogo),
        leading: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              border: Border.all(color: const Color.fromRGBO(209, 210, 216, 1)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
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
                  height: 56,
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
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: VigoTextField(
                    controller: userNameController,
                    obScureText: false,
                    hintText: 'User Name',
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                    //Icon(icon: icons.person),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: VigoTextField(
                    controller: emailController,
                    obScureText: false,
                    hintText: 'Email',
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: VigoTextField(
                      controller: passwordController,
                      obScureText: true,
                      hintText: 'Password',
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                      )
                      //Icon(icon: icons.person),
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: VigoTextField(
                      controller: confirmPasswordController,
                      obScureText: true,
                      hintText: 'Confirm password',
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                      )
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
                    'I agree to the Terms of Service and Privacy Policy.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ]),
                const SizedBox(height: 20),
                Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(129, 53, 249, 1),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
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
                const Spacer(),
                const Text(
                  'Have an account already? Login',
                  style: TextStyle(
                    color: Color.fromRGBO(142, 143, 153, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
