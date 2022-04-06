import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_status.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProposalDetailPage extends StatefulWidget {
  const ProposalDetailPage({Key? key}) : super(key: key);

  @override
  State<ProposalDetailPage> createState() => _ProposalDetailPageState();
}

class _ProposalDetailPageState extends State<ProposalDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: SafeArea(
          child: Column(
            children: [
              DSPrimaryAppBar.normal(
                title: S.current.proposal_detail_page_title,
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 38),
              Expanded(child: SingleChildScrollView(child: _buildBody()))
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#8',
                style: DSTextStyle.tsMontserratT20B
                    .copyWith(color: DSColors.tulipTree),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    'Dig Chain British Virgin Islands IBC and Financial Services Regulatory Sandbox Implementation',
                    style: DSTextStyle.tsMontserratT16M
                        .copyWith(color: DSColors.tulipTree),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const DSProposalStatus(),
          const SizedBox(
            height: 25,
          ),
          _InfoRowItem(
            name: S.current.proposal_id,
            value: '34',
          ),
          _InfoRowItem(
            name: S.current.proposer,
            value: 'dig14h2p084nt0u4m35ry6wu8et3wf6hv5kqyz2ktw',
            valueColor: DSColors.tulipTree,
          ),
          _InfoRowItem(
            name: S.current.total_deposit,
            value: '10000',
          ),
          _InfoRowItem(
            name: S.current.submitted_time,
            value: '2022-03-22 22:47:23',
          ),
          _InfoRowItem(
            name: S.current.voting_time,
            value: '2022-03-22 22:47:23 - 2022-03-24 22:47:23',
          ),
          _InfoRowItem(
            name: S.current.proposal_type,
            value: 'cosmos-sdk/TextProposal',
          ),
          _InfoRowItem(
            name: S.current.title,
            value:
                'Dig Chain British Virgin Islands IBC and Financial Services Regulatory Sandbox Implementation',
          ),
          _InfoRowItem(
            name: S.current.description,
            value:
                "Please Visit https://commonwealth.im/dig-chain/discussion/4004-dig-chain-british-virgin-islands-ibc-financial-services-regulatory-sandbox-implementation for full text Proposal. Dig Chain proposes following through with recent team business development actions to incorporate a legal entity as an International Business Corporation (IBC) in the British Virgin Islands (BVI). ",
          )
        ],
      ),
    );
  }
}

class _InfoRowItem extends StatelessWidget {
  final String name;
  final String value;
  final Color? valueColor;

  const _InfoRowItem(
      {required this.name,
      required this.value,
      this.valueColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              name,
              style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
            ),
          ),
          Expanded(
              child: Text(
            value,
            style: DSTextStyle.tsMontserratT12R.copyWith(color: valueColor),
          ))
        ],
      ),
    );
  }
}
