import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            const Text(
              'Please enter you email and e will send\n you a link to return you acount',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            const ForgotPassForm(),
          ],
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> error = [];
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: _formKey,
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
            } else if (value.isNotEmpty &&
                !error.contains(kInvalidEmailError)) {
              setState(() {
                error.add(kInvalidEmailError);
              });
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
        ),
        FormError(error: error),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        DefaultButton(
          text: 'Continue',
          press: () {
            if (_formKey.currentState!.validate()) {}
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        const NoAccountText(),
      ],
    );
  }
}
