import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_status.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class ProposalRowItem extends StatelessWidget {
  final Function? onDetailTap;

  const ProposalRowItem({this.onDetailTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#6',
                      style: DSTextStyle.tsMontserratT20B
                          .copyWith(color: Colors.black),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 2),
                        child: Text(
                          'DIG Chain Growth Initiative',
                          style: DSTextStyle.tsMontserratT16R
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const DSProposalStatus(withOpacity: 0.3,),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: DSTextStyle.tsMontserratT12R,
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: const [
                    Expanded(child: _ProposalDate()),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: _ProposalDate()),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: _ProposalDate()),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  color: DSColors.silver2,
                  height: 20,
                )
              ],
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: DSColors.silver2.withOpacity(0.3),
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    bottomEnd: Radius.circular(10))),
            child: Row(
              children: [
                const SizedBox(
                  width: 14,
                ),
                DSSmallButton(
                  title: 'Detail',
                  onTap: () => onDetailTap?.call(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProposalDate extends StatelessWidget {
  const _ProposalDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: DSColors.yellowOrange),
      child: Column(
        children: [
          Text(
            'Submit Date',
            style: DSTextStyle.tsMontserratT10R,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '2022-01-07',
            style: DSTextStyle.tsMontserratT10B,
          ),
        ],
      ),
    );
  }
}
