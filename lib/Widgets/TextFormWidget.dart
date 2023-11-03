import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textfieldProduct({
  TextEditingController? controller,
  required BuildContext context,
  required String name,
  TextInputType? inputtype,
  double? width,
  bool? isread,
  int? maxline,
  int? maxlength,
  String? value,
  List<TextInputFormatter>? inputFormatters,
  dynamic prefixIcon,
  dynamic suffixIcon,
  String? fieldtype,
  Function(String)? onChanged,
  bool? obscureText,
}) {
  return Container(
    width: width,
    child: TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: inputtype ?? TextInputType.text,
      initialValue: value,
      readOnly: isread ?? false,
      maxLines: maxline ?? 1,
      maxLength: maxlength,
      onChanged: onChanged ?? (value) {},
      style: TextStyle(
          color: Colors.white,
          ),
      inputFormatters: inputFormatters ??
          <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter,
          ],
      validator: (value) {
        if (value!.isEmpty) {
          return "Required this field";
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: name,
        alignLabelWithHint: true,
        labelStyle: Theme.of(context).textTheme.bodyText1!.merge(
              TextStyle(color: Colors.white),
            ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
    ),
  );
}



Widget textfieldProductSubject({
  TextEditingController? controller,
  required BuildContext context,
  required String name,
  TextInputType? inputtype,
  double? width,
  bool? isread,
  int? maxline,
  String? value,
  List<TextInputFormatter>? inputFormatters,
  dynamic prefixIcon,
  dynamic suffixIcon,
  String? fieldtype,
  Function(String)? onChanged,
  bool? obscureText,
}) {
  return Container(
    width: width,
    child: TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: inputtype ?? TextInputType.text,
      initialValue: value,
      readOnly: isread ?? false,
      maxLines: maxline ?? 1,
      onChanged: onChanged ?? (value) {},
      style: TextStyle(
          color: Colors.white,
          ),
      inputFormatters: inputFormatters ??
          <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter,
          ],
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: name,
        alignLabelWithHint: true,
        labelStyle: Theme.of(context).textTheme.bodyText1!.merge(
              TextStyle(color: Colors.white),
            ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
    ),
  );
}
