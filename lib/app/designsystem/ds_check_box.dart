import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

typedef OnDSCheckboxChanged = Function(bool value);

class DSCheckbox extends StatefulWidget {
  final OnDSCheckboxChanged onChanged;
  final String title;
  const DSCheckbox({required this.onChanged, this.title = '', Key? key})
      : super(key: key);

  @override
  State<DSCheckbox> createState() => _DSCheckboxState();
}

class _DSCheckboxState extends State<DSCheckbox> {
  bool _check = false;

  void _onChanged() {
    setState(() {
      _check = !_check;
    });
    widget.onChanged(_check);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: Checkbox(
              value: _check,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Colors.transparent,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(width: 1.0, color: Colors.white),
              ),
              onChanged: (value) {
                _onChanged();
              }),
        ),
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                _onChanged();
              },
              child: Text(
                widget.title,
                style: DSTextStyle.tsMontserrat.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
      ],
    );
  }
}
