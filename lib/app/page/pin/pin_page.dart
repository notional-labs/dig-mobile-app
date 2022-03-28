import 'package:dig_mobile_app/app/cubit/pin/pin_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_number_keyboard.dart';
import 'package:dig_mobile_app/app/designsystem/ds_pin_input.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> with WidgetUtil {
  final PinCubit _cubit = di();

  @override
  Widget build(BuildContext context) => DSBackground(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: BlocProvider(
            create: (_) => _cubit,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  children: [
                    if (checkLandscape(context)) const SizedBox(height: 30),
                    const _HeaderWidget(),
                    const Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: _BodyWidget()),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          DSPrimaryAppBar.normal(
            onBackButtonPressed: () {
              BlocProvider.of<PinCubit>(context).backEvent();
            },
          ),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(S.current.enter_your_password,
                  style: DSTextStyle.tsMontserratT20B
                      .copyWith(color: DSColors.tulipTree)),
            ),
          ),
        ],
      );
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> with WidgetUtil {
  final DSPinInputController _controller = DSPinInputController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: DSPinInput(
                  controller: _controller,
                  onChange: (String pin) {
                    BlocProvider.of<PinCubit>(context).changePinEvent(pin);
                  },
                  onPINFit: (_) {
                    BlocProvider.of<PinCubit>(context).continueEvent();
                    return Future.value(true);
                  },
                ),
              ),
            ),
          ),
          if (checkLandscape(context)) const SizedBox(height: 30),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: checkLandscape(context)
                    ? SingleChildScrollView(
                        child: _keyboardWidget(),
                      )
                    : _keyboardWidget(),
              ))
        ],
      );

  Widget _keyboardWidget() => DSNumberKeyboard(
        onDeleteTap: () {
          _controller.delete();
        },
        onCancelTap: () {
          _controller.clear();
        },
        onNumberTap: (String number) {
          _controller.add(number);
        },
      );
}
