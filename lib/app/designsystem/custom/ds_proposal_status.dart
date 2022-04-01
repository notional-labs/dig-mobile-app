import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSProposalStatus extends StatelessWidget {
  final ProposalStatusType type;

  const DSProposalStatus(
      {this.type = ProposalStatusType.unrecognized, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: DSColors.jungleGreen.withOpacity(0.3)),
      child: Text(
        'Passed',
        style:
            DSTextStyle.tsMontserratT16R.copyWith(color: DSColors.jungleGreen),
      ),
    );
  }
}
