import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSTextField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final FormFieldValidator<String>? validator;
  const DSTextField(
      {required this.onChange,
      this.textInputAction,
      this.textInputType,
      this.textCapitalization,
      this.hintText = '',
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.validator,
      Key? key})
      : super(key: key);

  @override
  _DSTextFieldState createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  final FocusNode _focusNode = FocusNode();
  String errorText = '';
  bool _enableBorder = false;
  bool _obscureText = false;

  bool get _shouldShowErrorMessage => errorText.isNotEmpty;

  BoxBorder? get _resolveBorder =>
      _enableBorder ? Border.all(color: DSColors.tulipTree) : null;

  void _onFocus() {
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _enableBorder = true;
        } else {
          _enableBorder = false;
        }
      });
    });
  }

  void _onIcEyeTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _setData() {
    _obscureText = widget.obscureText;
  }

  @override
  void initState() {
    super.initState();
    _setData();
    _onFocus();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: _resolveBorder,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: _focusNode,
                      onChanged: (value) {
                        widget.onChange.call(value);
                        setState(() {
                          errorText = widget.validator?.call(value) ?? '';
                        });
                      },
                      textInputAction: widget.textInputAction,
                      style: DSTextStyle.tsMontserrat.copyWith(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      obscureText: _obscureText,
                      enableSuggestions: widget.enableSuggestions,
                      autocorrect: widget.autocorrect,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: widget.hintText,
                          hintStyle: DSTextStyle.tsMontserrat.copyWith(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5))),
                    ),
                  ),
                  const SizedBox(width: 5),
                  if (widget.obscureText)
                    _PasswordToggleWidget(
                      onTap: _onIcEyeTap,
                    )
                ],
              ),
            ),
          ),
          if (_shouldShowErrorMessage) _ErrorMessageWidget(errorText: errorText)
        ],
      );
}

class _PasswordToggleWidget extends StatelessWidget {
  final VoidCallback onTap;
  const _PasswordToggleWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: Colors.transparent,
          height: double.infinity,
          child: Center(
            child: Image.asset(
              AppAssets.icEye,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                errorText,
                style: DSTextStyle.tsMontserrat.copyWith(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ))
        ],
      );
}
