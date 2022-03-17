import 'package:dig_mobile_app/app/cubit/import_account/import_account_cubit.dart';
import 'package:dig_mobile_app/app/cubit/import_account/import_account_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/designsystem/ds_underline_text_field.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportAccountPage extends StatefulWidget {
  const ImportAccountPage({Key? key}) : super(key: key);

  @override
  State<ImportAccountPage> createState() => _ImportAccountPageState();
}

class _ImportAccountPageState extends State<ImportAccountPage> with WidgetUtil {
  final ImportAccountCubit _cubit = di();

  @override
  Widget build(BuildContext context) => DSBackground(
      onTap: () {
        closeGlobalKeyboard();
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => _cubit,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (checkLandscape(context)) const SizedBox(height: 30),
                    const _Header(),
                    const SizedBox(height: 38),
                    const Expanded(child: _Body()),
                    const SizedBox(height: 15),
                    const _FooterWidget()
                  ]),
            ),
          ),
        ),
      ));
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DSPrimaryAppBar.action(
        onBackButtonPressed: () {
          BlocProvider.of<ImportAccountCubit>(context).backEnvent();
        },
        action: GestureDetector(
          onTap: () {
            BlocProvider.of<ImportAccountCubit>(context).tapAdvancedEvent();
          },
          child: Text(S.current.advanced,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: DSTextStyle.tsMontserrat.copyWith(
                  color: DSColors.tulipTree,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.import_account,
              style: DSTextStyle.tsMontserrat.copyWith(
                fontSize: 20,
                color: DSColors.tulipTree,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              S.current.enter_your_recovery_phrase,
              style: DSTextStyle.tsMontserrat.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: DSUnderlineTextField(
                  onChange: (value) {
                    BlocProvider.of<ImportAccountCubit>(context)
                        .changeRecoveryPhraseEvent(value);
                  },
                  maxLine: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            )
          ],
        ),
      );
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ImportAccountCubit, ImportAccountState>(
          builder: (_, state) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DSPrimaryButton(
                    enable: state.viewmodel.isValid,
                    title: S.current.import,
                    onTap: () {
                      BlocProvider.of<ImportAccountCubit>(context)
                          .importEvent();
                    }),
              ));
}
