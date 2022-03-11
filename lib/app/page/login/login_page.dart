import 'package:dig_mobile_app/app/cubit/login/login_cubit.dart';
import 'package:dig_mobile_app/app/cubit/login/login_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_span.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetUtil {
  final LoginCubit _cubit = di();

  bool get _shouldShowLogInBottomWidget =>
      MediaQuery.of(context).viewInsets.bottom == 0;

  void _cubitListener(context, state) {
    if (state is LoginLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (state is LoginAuthenticatedState) {
      _cubit.goToHomeEvent();
      return;
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider<LoginCubit>(
        create: (BuildContext context) => _cubit,
        child: BlocConsumer<LoginCubit, LoginState>(
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
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            S.current.wellcome,
            style: DSTextStyle.tsMontserrat.copyWith(
                color: DSColors.tulipTree,
                fontSize: 40,
                fontWeight: FontWeight.w700),
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
            hintText: S.current.email,
            onChange: (String value) {
              BlocProvider.of<LoginCubit>(context).changeEmailEvent(value);
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
        const SizedBox(height: 26),
        SizedBox(
          width: double.infinity,
          child: DSTextField(
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            hintText: S.current.password,
            obscureText: true,
            onChange: (String value) {
              BlocProvider.of<LoginCubit>(context).changePasswordEvent(value);
            },
          ),
        ),
        const SizedBox(height: 22),
        Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                closeGlobalKeyboard();
                BlocProvider.of<LoginCubit>(context).forgotPasswordEvent();
              },
              child: Text(
                S.current.forgot_you_password,
                style: DSTextStyle.tsMontserrat.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
        const SizedBox(height: 21),
        DSPrimaryButton(
          title: S.current.sign_in,
          onTap: () {
            closeGlobalKeyboard();
            BlocProvider.of<LoginCubit>(context).loginNormalEvent();
          },
        ),
        const SizedBox(height: 45),
        Align(
          alignment: Alignment.center,
          child: Text(
            S.current.or_sign_in_with,
            style: DSTextStyle.tsMontserrat.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                closeGlobalKeyboard();
                BlocProvider.of<LoginCubit>(context).loginWithGoogleEvent();
              },
              child: Image.asset(
                AppAssets.icGoogle,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                closeGlobalKeyboard();
                BlocProvider.of<LoginCubit>(context).loginWithTwitterEvent();
              },
              child: Image.asset(
                AppAssets.icTwitter,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                closeGlobalKeyboard();
                BlocProvider.of<LoginCubit>(context).loginWithFacebookEvent();
              },
              child: Image.asset(
                AppAssets.icFacebook,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                closeGlobalKeyboard();
                BlocProvider.of<LoginCubit>(context).loginWithAppleEvent();
              },
              child: Image.asset(
                AppAssets.icApple,
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
        const SizedBox(height: 48),
        Align(
          alignment: Alignment.center,
          child: DSTextSpan(
              S.current.dont_have_account_create,
              [
                DSTextSpanHighlight(
                    S.current.create,
                    DSTextStyle.tsMontserrat.copyWith(
                      color: DSColors.tulipTree,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    TapGestureRecognizer()
                      ..onTap = () {
                        closeGlobalKeyboard();
                        BlocProvider.of<LoginCubit>(context)
                            .goToCreateAccountEvent();
                      })
              ],
              DSTextStyle.tsMontserrat.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )).format(),
        ),
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
