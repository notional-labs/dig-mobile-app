import 'package:dig_mobile_app/app/cubit/create_account/create_account_cubit.dart';
import 'package:dig_mobile_app/app/cubit/create_account/create_account_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_check_box.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> with WidgetUtil {
  final CreateAccountCubit _cubit = di();

  bool get _shouldShowLogInBottomWidget =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  void _cubitListener(context, state) {
    if (state is CreateAccountLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (state is CreateAccountSuccessState) {
      _cubit.goToHomeEvent();
      return;
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider<CreateAccountCubit>(
        create: (BuildContext context) => _cubit,
        child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: _cubitListener,
          builder: (context, state) => _bodyWidget(),
        ),
      );

  DSBackground _bodyWidget() => DSBackground(
        onTap: () {
          closeGlobalKeyboard();
        },
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(height: 30),
                            _HeaderWidget(),
                            SizedBox(height: 73),
                            _BodyWidget(),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_shouldShowLogInBottomWidget)
                    const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: _BottomWidget())
                ],
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
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.icDigLogoWithText,
      width: 68,
      height: 50,
    );
  }
}

class _BodyWidget extends StatelessWidget with WidgetUtil {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: false,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '',
              style: DSTextStyle.tsMontserrat.copyWith(
                  color: DSColors.tulipTree,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            S.current.sign_in_on_your_account,
            style: DSTextStyle.tsMontserrat.copyWith(
                color: DSColors.tulipTree,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 22),
        SizedBox(
          width: double.infinity,
          child: DSTextField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            autocorrect: false,
            hintText: S.current.a_with_asterisk(S.current.first_name),
            onChange: (String value) {
              BlocProvider.of<CreateAccountCubit>(context)
                  .changeFirstnameEvent(value);
            },
          ),
        ),
        const SizedBox(height: 26),
        SizedBox(
          width: double.infinity,
          child: DSTextField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            autocorrect: false,
            hintText: S.current.a_with_asterisk(S.current.last_name),
            onChange: (String value) {
              BlocProvider.of<CreateAccountCubit>(context)
                  .changeLastnameEvent(value);
            },
          ),
        ),
        const SizedBox(height: 21),
        SizedBox(
          width: double.infinity,
          child: DSTextField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            autocorrect: false,
            hintText: S.current.a_with_asterisk(S.current.email),
            onChange: (String value) {
              BlocProvider.of<CreateAccountCubit>(context)
                  .changeEmailEvent(value);
            },
            validator: (String? value) {
              final errMess = EmailValidator(
                          errorText: S.current.sign_up_form_hint_invalid_email)
                      .call(value) ??
                  '';
              return errMess;
            },
          ),
        ),
        const SizedBox(
          height: 21,
        ),
        SizedBox(
          width: double.infinity,
          child: DSTextField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            hintText: S.current.a_with_asterisk(S.current.password),
            obscureText: true,
            onChange: (String value) {
              BlocProvider.of<CreateAccountCubit>(context)
                  .changePasswordEvent(value);
            },
          ),
        ),
        const SizedBox(height: 19),
        DSCheckbox(
          title: S.current.i_accpect_all_terms_and_conditions,
          onChanged: (bool value) {
            BlocProvider.of<CreateAccountCubit>(context)
                .changeAcceptTermEvent(value);
          },
        ),
        const SizedBox(height: 21),
        DSPrimaryButton(
          title: S.current.create,
          onTap: () {
            closeGlobalKeyboard();
            BlocProvider.of<CreateAccountCubit>(context).createAccountEvent();
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.current.copyright_2021_digchain,
      style: DSTextStyle.tsMontserrat.copyWith(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
