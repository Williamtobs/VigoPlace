import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/images.dart';
import 'login_screen.dart';
import 'sign_up.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final Shader _linearGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.5),
      Color.fromRGBO(31, 241, 227, 0.5),
      Color.fromRGBO(129, 53, 249, 0.8)
    ],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 5, left: 5, bottom: 3),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(vigoLogo),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: Container(
                      height: 280,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(42),
                          child: Image.asset(img1, fit: BoxFit.fill)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 280,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(42),
                          child: Image.asset(img2, fit: BoxFit.fill)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Container(
                        height: 82,
                        width: 82,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(360),
                            color: const Color.fromRGBO(129, 53, 249, 1),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.05, 0.01, 0.7],
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(31, 241, 227, 0.5),
                                Color.fromRGBO(129, 53, 249, 0.8)
                              ],
                            )),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 177,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(42),
                            child: Image.asset(img3, fit: BoxFit.fill)),
                      ),
                      const SizedBox(height: 5),
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
                  Expanded(
                    child: Container(
                      height: 243,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(42),
                          child: Image.asset(img4, fit: BoxFit.fill)),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Text('Build connections.\nBuild wealth.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700,
                      //color: const Color.fromRGBO(31, 241, 227, 0.5),
                      foreground: Paint()..shader = _linearGradient,
                      fontSize: 28,
                      height: 1.5)),
              // const SizedBox(height: 3),
              // Text('Build wealth.',
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.ubuntu(
              //         fontWeight: FontWeight.w700,
              //         color: const Color.fromRGBO(129, 53, 249, 1),
              //         //foreground: Paint()..shader = _linearGradient,
              //         fontSize: 28,
              //         height: 1.5)),
              const SizedBox(height: 20),
              SizedBox(
                  child: Text(
                'Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(108, 109, 121, 1),
                ),
              )),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: const Color.fromRGBO(129, 53, 249, 1),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
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
