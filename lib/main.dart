import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:medica/const/colors.dart';
import 'package:medica/ui/custom_scheme_color.dart';
import 'package:medica/ui/pages/user_management/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: CustomSchemeColor().lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
          colorScheme: CustomSchemeColor().darkColorScheme, useMaterial3: true),
      locale: const Locale('ar'),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SignInPage(),
    );
  }
}
