import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medica/const/images.dart';
import 'package:medica/const/spaces.dart';
import 'package:medica/const/text_styles.dart';
import 'package:medica/ui/pages/user_management/sign_in_page.dart';
import 'package:medica/ui/widget/custom_button.dart';
import 'package:medica/ui/widget/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        body: Scrollbar(
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              children: [
                SizedBox(height: veryLargeSpace,),

                Image.asset(
                  logo,
                  height: 60,
                ),
                Text(
                  appLocalizations.sign_up_page_title,
                  style: titleStyle,
                ),
                CustomTextField(
                    name: 'firstName',
                    label: appLocalizations.sign_up_page_first_name_hint,
                    type: TextFieldType.plainText,
                    autofillHints: const <String>[
                      AutofillHints.name,
                    ],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.person),
                    validator: FormBuilderValidators.required(
                        errorText: appLocalizations
                            .sign_up_page_first_name_error_empty)),
                CustomTextField(
                    name: 'lastName',
                    label: appLocalizations.sign_up_page_last_name_hint,
                    type: TextFieldType.plainText,
                    autofillHints: const <String>[
                      AutofillHints.familyName,
                    ],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.person),
                    validator: FormBuilderValidators.required(
                        errorText: appLocalizations
                            .sign_up_page_last_name_error_empty)),
                CustomTextField(
                    name: 'address',
                    label: appLocalizations.sign_up_page_address_hint,
                    type: TextFieldType.plainText,
                    autofillHints: const <String>[
                      AutofillHints.fullStreetAddress,
                      AutofillHints.addressCity,
                    ],
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.place),
                    validator: FormBuilderValidators.required(
                        errorText:
                            appLocalizations.sign_up_page_address_error_empty)
                    //
                    ),
                buildGender(appLocalizations),
                FormBuilderDateTimePicker(
                    name: 'birthday',
                    textInputAction: TextInputAction.next,
                    inputType: InputType.date,
                    lastDate: DateTime.now(),
                    decoration: InputDecoration(
                        label:
                            Text(appLocalizations.sign_up_page_birthday_hint),
                        prefixIcon: const Icon(Icons.date_range)),
                    validator: FormBuilderValidators.required(
                        errorText:
                            appLocalizations.sign_up_page_birthday_error_empty)),
                CustomTextField(
                    name: 'phone',
                    label: appLocalizations.sign_up_page_phone_hint,
                    type: TextFieldType.plainText,
                    autofillHints: const <String>[
                      AutofillHints.telephoneNumber,
                    ],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.phone),
                    validator: phoneValidator(appLocalizations)),
                CustomTextField(
                  name: 'email',
                  label: appLocalizations.sign_up_page_email_hint,
                  type: TextFieldType.plainText,
                  autofillHints: const <String>[
                    AutofillHints.email,
                  ],
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(Icons.email),
                  validator: emailValidator(appLocalizations),
                ),
                CustomTextField(
                    name: 'password',
                    label: appLocalizations.password,
                    autofillHints: const <String>[
                      AutofillHints.newPassword,
                    ],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    type: TextFieldType.password,
                    validator: passwordValidator(appLocalizations),
                    prefixIcon: const Icon(Icons.vpn_key)),
                CustomTextField(
                    label: appLocalizations.sign_up_page_confirm_password_hint,
                    name: 'passwordConfirm',
                    autofillHints: const <String>[
                      AutofillHints.password,
                    ],
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.name,
                    type: TextFieldType.password,
                    validator: passwordConfirmValidator(appLocalizations),
                    onFieldSubmitted: (_) => onSignUp(),
                    prefixIcon: const Icon(Icons.vpn_key)),
                const SizedBox(height: smallSpace,),
                CustomButton(
                    onPressed: onSignUp,
                    data: appLocalizations.sign_up_page_action_button),
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
                        onTap: signIn,
                        child:  Text(
                          appLocalizations.sign_in,
                          style: redStyle,
                        ))),
                const SizedBox(height: 200,)
              ].map((e) => Padding(padding: const EdgeInsets.only(top: smallSpace),child: e,)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  FormFieldValidator<String> passwordValidator(
      AppLocalizations appLocalizations) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText: appLocalizations.sign_up_page_password_error_empty),
      FormBuilderValidators.minLength(8,
          errorText: appLocalizations.sign_up_page_password_error_invalid)
    ]);
  }

  FormFieldValidator<String> passwordConfirmValidator(
      AppLocalizations appLocalizations) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText:
              appLocalizations.sign_up_page_confirm_password_error_empty),
      (value) {
        if (_formKey.currentState?.fields['password'] !=
            _formKey.currentState?.fields['passwordConfirm']) {
          return appLocalizations.sign_up_page_confirm_password_error_invalid;
        }

        return null;
      },
    ]);
  }

  FormFieldValidator<String> emailValidator(AppLocalizations appLocalizations) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText: appLocalizations.sign_up_page_email_error_empty),
      FormBuilderValidators.email(
          errorText: appLocalizations.sign_up_page_email_error_invalid),
    ]);
  }

  FormFieldValidator<String> phoneValidator(AppLocalizations appLocalizations) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText: appLocalizations.sign_up_page_phone_error_empty),
      FormBuilderValidators.numeric(
          errorText: appLocalizations.sign_up_page_phone_error_number),
      FormBuilderValidators.minLength(9)
    ]);
  }

  FormBuilderRadioGroup<String> buildGender(AppLocalizations appLocalizations) {
    final gender = [
      appLocalizations.sign_up_page_male,
      appLocalizations.sign_up_page_female
    ];

    return FormBuilderRadioGroup(
      decoration: InputDecoration(
          labelText: appLocalizations.sign_up_page_gender_hint,
          prefixIcon: const Icon(Icons.people_alt),
          border: InputBorder.none),
      name: 'gender',
      validator: FormBuilderValidators.required(
          errorText: appLocalizations.sign_up_page_gender_error_empty),
      options: gender
          .map((value) => FormBuilderFieldOption(value: value))
          .toList(growable: false),
    );
  }

  void signIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const SignInPage()));
  }

  void onSignUp() {
    if (_formKey.currentState!.validate()) {}
  }
}
