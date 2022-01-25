import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final String icon;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChange;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.validator,
    this.onChange,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _errorText;
  bool _isFocused = false;

  void _onFocusChanged(value) {
    setState(() {
      _isFocused = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: _onFocusChanged,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _isFocused ? ThemeColor.primary : ThemeColor.grey,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        widget.icon,
                        color: _isFocused ? ThemeColor.primary : ThemeColor.grey,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          obscureText: widget.obscureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorStyle: const TextStyle(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            isCollapsed: true,
                            hintText: widget.hintText,
                            hintStyle: ThemeText.normal.copyWith(
                              color: ThemeColor.text60,
                              fontSize: 14,
                            ),
                          ),
                          style: ThemeText.normal.copyWith(fontSize: 14),
                          onChanged: widget.onChange,
                          validator: (value) {
                            if (widget.validator != null) {
                              String? errorText = widget.validator!(value);
                              setState(() {
                                _errorText = errorText;
                              });
                              return errorText;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ThemeColor.white,
                  margin: const EdgeInsets.only(left: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.label,
                    style: ThemeText.medium.copyWith(
                      color: _isFocused ? ThemeColor.text : ThemeColor.text60,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (_errorText != null)
            Row(
              children: [
                SvgPicture.asset('assets/icons/alert.svg'),
                const SizedBox(width: 8),
                Text(_errorText!,
                    style: ThemeText.normal.copyWith(
                      color: ThemeColor.alert,
                      fontSize: 12,
                    )),
              ],
            ),
        ],
      ),
    );
  }
}
