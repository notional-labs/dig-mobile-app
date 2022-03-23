import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmRecoveryPhrase extends StatefulWidget {
  final String mnemonic;

  const ConfirmRecoveryPhrase({required this.mnemonic, Key? key})
      : super(key: key);

  @override
  State<ConfirmRecoveryPhrase> createState() => _ConfirmRecoveryPhraseState();
}

class _ConfirmRecoveryPhraseState extends State<ConfirmRecoveryPhrase> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              child: DSPrimaryAppBar.normal(
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              top: 50,
              start: 0,
              end: 0,
            ),
            Positioned.directional(
                top: 80,
                start: 0,
                end: 0,
                bottom: 0,
                textDirection: TextDirection.ltr,
                child: _buildBody(context))
          ],
        ),
      )),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.confirm_recovery_phrase,
            style: DSTextStyle.tsMontserratT20B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: _buildConfirmResultGrid(),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(child: _buildSelectGrid()),
          const SizedBox(
            height: 20,
          ),
          DSPrimaryButton(
              title: S.current.continue_text,
              onTap: () {
                /// TODO: Recheck later
                Navigator.of(context).pushNamed(DigPageName.nameAccount);
              })
        ],
      ),
    );
  }

  Widget _buildConfirmResultGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      padding: const EdgeInsets.all(6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / .4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _ConfirmResultGridItem(
          index: index + 1,
          text: 'dig',
        );
      },
    );
  }

  Widget _buildSelectGrid() {
    return GridView.builder(
      itemCount: 50,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 14,
        childAspectRatio: 1 / .4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _PhraseGridItem(
          index: index + 1,
          text: 'dig',
        );
      },
    );
  }
}

class _PhraseGridItem extends StatelessWidget {
  final int index;
  final String text;

  const _PhraseGridItem({this.index = 0, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: DSColors.tulipTree)),
      child: Center(
          child: Text(
        index.toString(),
        style: DSTextStyle.tsMontserratT10R.copyWith(color: DSColors.tulipTree),
      )),
    );
  }
}

class _ConfirmResultGridItem extends StatelessWidget {
  final int index;
  final String text;

  const _ConfirmResultGridItem({this.index = 0, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DSColors.tundora, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                index.toString(),
                style:
                    DSTextStyle.tsMontserratT10R.copyWith(color: Colors.black),
              )),
            ),
          ),
          Expanded(
            child: Text(text,
                maxLines: 1,
                style:
                    DSTextStyle.tsMontserratT10R.copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
