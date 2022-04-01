import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposals/proposal_row_item.dart';
import 'package:flutter/material.dart';

class ProposalsPage extends StatefulWidget {
  const ProposalsPage({Key? key}) : super(key: key);

  @override
  State<ProposalsPage> createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          Text(
            'proposals'.toUpperCase(),
            style: DSTextStyle.tsMontserratT32B
                .copyWith(color: DSColors.tulipTree),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: 25,
            ),
            itemCount: 10,
            itemBuilder: (_, index) => const ProposalRowItem(),
          )),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
