import 'package:ecommerce/screens/login_success/login_success.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../forgot_password/forgot_password_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final List<String> error = [];

  String email = '';
  String password = '';
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmail(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPassword(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (Value) {
                  setState(() {
                    remember = Value!;
                  });
                },
              ),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPassword.routeName),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          FormError(error: error),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, LoginSuccess.routeName);
                }
              }),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
        ],
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kPassNullError)) {
          setState(() {
            error.remove(kPassNullError);
          });
        } else if (value.length >= 8 && error.contains(kShortPassError)) {
          setState(() {
            error.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kPassNullError)) {
          setState(() {
            error.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !error.contains(kShortPassError)) {
          setState(() {
            error.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: customSuffixIcon(
          icon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kEmailNullError)) {
          setState(() {
            error.remove(kEmailNullError);
          });
        } else if (value.isNotEmpty && error.contains(kInvalidEmailError)) {
          setState(() {
            error.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kEmailNullError)) {
          setState(() {
            error.add(kEmailNullError);
          });
          return "";
        } else if (value.isNotEmpty && !error.contains(kInvalidEmailError)) {
          setState(() {
            error.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: customSuffixIcon(
          icon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
