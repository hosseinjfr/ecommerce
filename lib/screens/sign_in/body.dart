import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/components/social_cards.dart';
import 'package:ecommerce/screens/sign_in/sign_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sign in with your email and passsword \n or countinue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  child: const SignIn(),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialCards(
                      image: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    socialCards(
                      image: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    socialCards(
                      image: 'assets/icons/twitter.svg',
                      press: () {},
                    ),
                  ],
                ),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
