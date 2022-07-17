import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/splash/components/splash_content.dart';
import 'package:ecommerce/screens/splash/sign_in/sign_in_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  List<Map<String, String>> splashData = [
    {"text": "Welcome to TOKOTO", "image": "assets/images/splash_1.png"},
    {"text": "Easy Shopping", "image": "assets/images/splash_2.png"},
    {"text": "Best Price", "image": "assets/images/splash_3.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: ((context, index) => SplashContent(
                      text: splashData[index]["text"],
                      image: splashData[index]["image"],
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    const Spacer(),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6.0,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? kPrimaryColor : const Color(0xdfd8d8d8),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
