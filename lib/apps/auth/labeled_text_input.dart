import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextInput extends StatefulWidget {
  const LabeledTextInput(
      {Key? key,
      this.text,
      this.label = "",
      this.onChanged,
      this.onSubmit,
      this.style,
      this.labelStyle,
      this.numLines = 1,
      this.hintText,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.autofillHints,
      this.obscureText = false,
      this.autoFocus = false,
      this.validator,
      this.maxLength})
      : super(key: key);

  final String label;
  final String? text;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final int numLines;
  final int? maxLength;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmit;
  final String? hintText;
  final TextEditingController? controller;
  final List<String>? autofillHints;
  final bool obscureText;
  final bool autoFocus;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  @override
  _LabeledTextInputState createState() => _LabeledTextInputState();
}

class _LabeledTextInputState extends State<LabeledTextInput> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: Theme.of(context).copyWith(
        visualDensity: theme.visualDensity,
        textTheme: ThemeData.dark().textTheme,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // label + spacing

          Text(widget.label,
              style:
                  widget.labelStyle ?? Theme.of(context).textTheme.bodySmall),
          // VSpace.med,

          // TextField
          TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            autofillHints: widget.autofillHints,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            validator: widget.validator,
            onFieldSubmitted: widget.onSubmit,
            onChanged: widget.onChanged,
            initialValue: widget.text,
            style: widget.style ?? Theme.of(context).textTheme.bodySmall,
            autofocus: widget.autoFocus,
            minLines: widget.numLines,
            maxLines: widget.numLines,
            obscureText: _obscureText,
            decoration: InputDecoration(
                iconColor: theme.colorScheme.onSurface,
                suffixIcon: _obscureText
                    ? IconButton(
                        icon: Icon(Icons.visibility_off,
                            color: theme.colorScheme.onSurface),
                        onPressed: () async {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                          await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                hintText: widget.hintText ?? "",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                        color: theme.colorScheme.onSurface,
                        width: 1,
                        style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                        color: theme.colorScheme.secondary,
                        width: 1,
                        style: BorderStyle.solid)),
                contentPadding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 24.0 + theme.visualDensity.vertical * 1,
                  bottom: 24.0 + theme.visualDensity.vertical * 1,
                ),
                isDense: true),
          ),
        ],
      ),
    );
  }
}
