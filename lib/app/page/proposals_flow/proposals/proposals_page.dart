import 'package:dig_mobile_app/app/cubit/proposals/proposals_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposals/proposal_row_item.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/proposals_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProposalsPage extends StatefulWidget {
  const ProposalsPage({Key? key}) : super(key: key);

  @override
  State<ProposalsPage> createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage>
    with WidgetUtil, AutomaticKeepAliveClientMixin {
  final ProposalsCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _cubit.getProposals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProposalsCubit, ProposalsState>(
      bloc: _cubit,
      listener: _listener,
      builder: (_, state) => _buildBody(state.model),
    );
  }

  void _listener(_, currentState) {
    if (currentState is ProposalsLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (currentState is ProposalsErrorState) {
      showGlobalDSSnackBar(
          message: currentState.exception.message, type: DSSnackBarType.error);
      return;
    }
  }

  Widget _buildBody(ProposalsViewModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          Text(
            S.current.proposals.toUpperCase(),
            style: DSTextStyle.tsMontserratT32B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(
              height: 25,
            ),
            itemCount: model.proposals.length,
            itemBuilder: (_, index) => ProposalRowItem(
              proposal: model.proposals[index],
              onDetailTap: () => _cubit.onDetailTap(model.proposals[index]),
            ),
          )),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
