import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:medica/const/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medica/const/spaces.dart';
import 'package:medica/const/text_styles.dart';
import 'package:medica/ui/widget/custom_button.dart';
import 'package:medica/ui/widget/custom_text_field.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(elevation: 0 ,backgroundColor: Colors.transparent,),
      body: SafeArea(
        child: Scrollbar(
            child: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            children: [
              Image.asset(
                logo,
                height: 60,
              ),
              Text(
                appLocalization.sign_in,
                style: titleStyle,
              ),
              CustomTextField(
                name: appLocalization.username_or_email,
                autofillHints: const <String>[
                  AutofillHints.name,
                  AutofillHints.email
                ],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                type: TextFieldType.plainText,
                prefixIcon: const Icon(Icons.person),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return appLocalization.login_page_username_or_email;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: veryLargeSpace,
              ),
              CustomTextField(
                  name: appLocalization.password,
                  autofillHints: const <String>[
                    AutofillHints.password,
                  ],
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.name,
                  type: TextFieldType.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalization.login_page_password_error_empty;
                    }

                    return null;
                  },
                  onFieldSubmitted: (String? password) {
                    if (password?.isNotEmpty ?? false) {
                      signUp();
                    } else {
                      _formKey.currentState!.validate();
                    }
                  },
                  prefixIcon: const Icon(Icons.vpn_key)),
              const SizedBox(
                height: veryLargeSpace,
              ),
              CustomButton(onPressed: onSignIn, data:appLocalization.sign_in ),
              const SizedBox(
                height: veryLargeSpace,
              ),

              // Divider( color: Colors.black, thickness: 2,height: 2,endIndent: 0 , indent:  size.width * .6,),
              //
              // Divider(),
              const Row(children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('or'),
                ),
                Expanded(child: Divider()),
              ]),
              Center(
                  child: InkWell(
                      onTap: signUp,
                      child:  Text(
                        appLocalization.create_account,
                        style: redStyle,
                      )))
            ],
          ),
        )),
      ),
    );
  }

  Future<void> onSignIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  void signUp() {}
}
