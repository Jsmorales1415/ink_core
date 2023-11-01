import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_core/ink_core.dart';

class InkTextField extends StatefulWidget {
  const InkTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.onFocus,
    this.controller,
    this.prefix,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.title,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide,
    this.textAlign = TextAlign.start,
    this.fillColor = Palette.darkGrey,
    this.verticalPadding = 12,
    this.textStyle,
    this.obscureText = false,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.copyToClipboard = false,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.onCopied,
    this.suffixIcon,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
  });

  const InkTextField.password({
    super.key,
    this.onChanged,
    this.hintText,
    this.onFocus,
    this.controller,
    this.prefix,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.title,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide,
    this.textAlign = TextAlign.start,
    this.fillColor = Palette.darkGrey,
    this.verticalPadding = 12,
    this.textStyle,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
  })  : obscureText = true,
        copyToClipboard = false,
        onCopied = null,
        suffixIcon = null;

  const InkTextField.copyToClipboard({
    super.key,
    this.onChanged,
    this.hintText,
    this.onFocus,
    this.controller,
    this.prefix,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.title,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide,
    this.textAlign = TextAlign.start,
    this.fillColor = Palette.darkGrey,
    this.verticalPadding = 12,
    this.textStyle,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.onCopied,
    this.isDense = false,
    this.autocorrect = true,
  })  : obscureText = false,
        copyToClipboard = true,
        suffixIcon = null;

  final ValueChanged<String>? onChanged;
  final String? hintText;
  final ValueChanged<bool>? onFocus;
  final TextEditingController? controller;
  final Widget? prefix;
  final IconData? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final int? lines;
  final List<TextInputFormatter> formatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? title;
  final String? optionalText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final BorderSide? borderSide;
  final TextAlign textAlign;
  final Color fillColor;
  final double verticalPadding;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool hasError;
  final bool readOnly;
  final String? initialValue;
  final bool copyToClipboard;
  final Widget? error;
  final bool autofocus;
  final bool enable;
  final Color? hintTextColor;
  final VoidCallback? onTooltip;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final VoidCallback? onCopied;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isDense;
  final bool autocorrect;

  @override
  State<InkTextField> createState() => _InkTextFieldState();
}

class _InkTextFieldState extends State<InkTextField> {
  late final FocusNode focusNode;
  late final ValueNotifier<bool> obscureText;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();

    focusNode.addListener(focusListener);
    obscureText = ValueNotifier<bool>(widget.obscureText);
    super.initState();
  }

  void focusListener() {
    widget.onFocus?.call(focusNode.hasFocus);
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(focusListener)
      ..dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder({
    Color? color,
    BorderSide? borderSide,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius10,
        borderSide: borderSide ??
            BorderSide(
              color: color ?? Palette.darkGrey,
            ),
      );

  @override
  Widget build(BuildContext context) {
    final prefixIcon = widget.prefixIcon;
    final suffixIcon = getSuffixIcon();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          OGTextWithOptional(
            title: widget.title!,
            optionalText: widget.optionalText,
            onTooltip: widget.onTooltip,
          ),
          gap8,
        ],
        ValueListenableBuilder(
          valueListenable: obscureText,
          builder: (context, value, child) => TextFormField(
            autofocus: widget.autofocus,
            autocorrect: widget.autocorrect,
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onSubmitted,
            obscuringCharacter: '*',
            obscureText: obscureText.value,
            onChanged: widget.onChanged,
            focusNode: widget.focusNode ?? focusNode,
            controller: widget.controller,
            validator: widget.validator,
            enabled: widget.enable,
            keyboardType: widget.keyboardType,
            autovalidateMode: widget.autovalidateMode,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              isDense: widget.isDense,
              fillColor: widget.fillColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
              ).copyWith(right: 12),
              prefix: prefixIcon == null ? space12 : null,
              prefixIcon: widget.prefix ??
                  (prefixIcon == null
                      ? null
                      : Icon(
                          prefixIcon,
                          size: 18,
                          color: Palette.paleRed,
                        )),
              border: _inputBorder(borderSide: widget.borderSide),
              hintText: widget.hintText,
              enabledBorder: _inputBorder(borderSide: widget.borderSide),
              hintStyle: context.textTheme.bodyMedium?.copyWith(
                color: widget.hintTextColor ?? Palette.white.withOpacity(.25),
                fontWeight: AppFontWeight.regular,
              ),
              errorStyle: context.textTheme.body.copyWith(
                color: Palette.redErrorAndAlert,
              ),
              labelStyle: context.textTheme.bodyMedium?.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
              errorBorder: _inputBorder(color: Palette.redErrorAndAlert),
              focusedErrorBorder: _inputBorder(color: Palette.redErrorAndAlert),
              focusedBorder: _inputBorder(
                color: widget.hasError
                    ? Palette.redErrorAndAlert
                    : context.theme.primaryColor,
              ),
              suffixIcon: suffixIcon,
            ),
            textAlign: widget.textAlign,
            minLines: widget.lines ?? widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.lines ?? widget.maxLines,
            inputFormatters: [
              ...widget.formatters,
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            style: widget.textStyle ??
                context.textTheme.bodyMedium?.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
          ),
        ),
        if (widget.error != null) ...[
          gap4,
          widget.error!,
        ],
      ],
    );
  }

  Widget? getSuffixIcon() {
    Widget? suffixIcon;
    suffixIcon = widget.suffixIcon;

    if (widget.obscureText) {
      suffixIcon = ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, value, child) => IconButton(
          onPressed: () => obscureText.value = !obscureText.value,
          splashColor: Colors.transparent,
          splashRadius: 1,
          style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
          icon: value
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.remove_red_eye_outlined),
        ),
      );
    }

    if (widget.copyToClipboard) {
      suffixIcon = IconButton(
        splashColor: Colors.transparent,
        splashRadius: 1,
        onPressed: () {
          Clipboard.setData(
            ClipboardData(
              text: widget.controller?.text ?? widget.initialValue ?? '',
            ),
          );
          widget.onCopied?.call();
        },
        icon: const Icon(Icons.copy),
      );
    }

    return suffixIcon;
  }
}
