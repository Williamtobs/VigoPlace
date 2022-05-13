import 'package:flutter/material.dart';

import '../Constant/images.dart';
import 'login_screen.dart';
import 'sign_up.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(vigoLogo),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 311,
                  width: 82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(42),
                      child: Image.asset(img1, fit: BoxFit.fill)),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 243,
                  width: 82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(42),
                      child: Image.asset(img2, fit: BoxFit.fill)),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Container(
                      height: 82,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: const Color.fromRGBO(129, 53, 249, 1)),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 177,
                      width: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(42),
                          child: Image.asset(img3, fit: BoxFit.fill)),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 82,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: const Color.fromRGBO(250, 83, 83, 1)),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Container(
                  height: 243,
                  width: 82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(42),
                      child: Image.asset(img4, fit: BoxFit.fill)),
                ),
              ]),
              const SizedBox(height: 20),
              Text('Build connections. \nBuild wealth.',
                  textAlign: TextAlign.center, style: TextStyle()),
              const SizedBox(height: 10),
              const SizedBox(
                  child: Text(
                'Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.',
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(129, 53, 249, 1),
                  // gradient: [

                  // ]
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border:
                      Border.all(color: const Color.fromRGBO(129, 53, 249, 1)),
                  // gradient: [

                  // ]
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                      //SignUpScreen
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color.fromRGBO(129, 53, 249, 1)),
                    )),
              ),
            ]),
      ),
    ));
  }
}
