import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TextFieldType { plainText, password }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.name,
    required this.label,
    this.keyboardType,
    this.initialValue,
    this.type = TextFieldType.plainText,
    this.validator,
    this.prefixIcon,
    this.autofillHints,
    this.autofocus,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  final String label;
  final String name;
  final TextFieldType type;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String?>? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.type == TextFieldType.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      validator: widget.validator,
      name: widget.name,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      autofillHints: widget.autofillHints,
      autofocus: widget.autofocus ?? false,
      focusNode: widget.focusNode,
      onSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: buildVisibilityIcon(context),
        labelText: widget.label,
        // border: const OutlineInputBorder()
      ),
    );
  }

  IconButton? buildVisibilityIcon(BuildContext context) {
    return widget.type == TextFieldType.password
        ? IconButton(
            tooltip: AppLocalizations.of(context)?.show_password,
            splashRadius: 10.0,
            onPressed: () => setState(() {
              _obscureText = !_obscureText;
            }),
            icon: _obscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          )
        : null;
  }
}
