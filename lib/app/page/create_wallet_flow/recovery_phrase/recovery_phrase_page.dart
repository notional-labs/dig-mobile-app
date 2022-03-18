import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecoveryPhrasePage extends StatelessWidget {
  const RecoveryPhrasePage({Key? key}) : super(key: key);

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
                child: _buildBody())
          ],
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.your_recovery_phrase,
            style: DSTextStyle.tsMontserratT20B
                .copyWith(color: DSColors.tulipTree),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(S.current.your_recovery_phrase_description,
                style:
                    DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white)),
          ),
          Expanded(child: _buildRecoveryPhraseGrid()),
          const SizedBox(
            height: 20,
          ),
          const _CopyToClipBoard(
            isCopied: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
            ),
          ),
          DSPrimaryButton(title: S.current.continue_text, onTap: () {})
        ],
      ),
    );
  }

  Widget _buildRecoveryPhraseGrid() {
    return GridView.builder(
      itemCount: 24,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 14,
        childAspectRatio: 1 / .4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _PhraseGridItem(
          index: index,
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
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: DSColors.tulipTree, shape: BoxShape.circle),
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
                    DSTextStyle.tsMontserratT10R.copyWith(color: Colors.black)),
          )
        ],
      ),
    );
  }
}

class _CopyToClipBoard extends StatelessWidget {
  final bool isCopied;
  final Function? onTap;

  const _CopyToClipBoard({this.isCopied = false, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isCopied
              ? SvgPicture.asset(
                  AppAssets.icCopied,
                  width: 16,
                  height: 16,
                )
              : const Icon(
                  Icons.copy,
                  size: 16,
                  color: DSColors.tulipTree,
                ),
          const SizedBox(
            width: 6,
          ),
          Text(
            isCopied
                ? S.current.copied_to_clipboard
                : S.current.copy_to_clipboard,
            style: DSTextStyle.tsMontserratT16M.copyWith(
                color: isCopied ? DSColors.jungleGreen : DSColors.tulipTree),
          )
        ],
      ),
    );
  }
}
