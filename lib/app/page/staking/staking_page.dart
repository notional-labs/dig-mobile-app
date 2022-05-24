import 'package:dig_mobile_app/app/cubit/staking/staking_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_refresh_cupertino_sliver.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_span.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/staking/delegate/delegate_widget.dart';
import 'package:dig_mobile_app/app/page/staking/staking_tem.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakingPage extends StatefulWidget {
  const StakingPage({Key? key}) : super(key: key);

  @override
  State<StakingPage> createState() => _StakingPageState();
}

class _StakingPageState extends State<StakingPage>
    with WidgetUtil, AutomaticKeepAliveClientMixin {
  final StakingCubit _cubit = di();

  void _onBlocListener(context, state) {
    if (state is StakingLoadingState && !state.isRefresh) {
      showGlobalLoadingOverlay();
      return;
    }

    dismissGlobalLoadingOverlay();

    if (state is StakingErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }

    if (state is StakingShowDelegateDialogState) {
      showFullScreenDialog(
          context: context,
          child: DelegateWidget(
              param: DelegateWidgetParam(
                  account: state.viewmodel.getAccount,
                  tokenAvailable: state.viewmodel.balance,
                  validatorSelected: state.validatorSelected,
                  validators: state.viewmodel.validatorItems)));
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _cubit.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => _cubit,
            child: SafeArea(
                child: BlocConsumer<StakingCubit, StakingState>(
                    builder: (context, state) {
                      return _body(state.viewmodel);
                    },
                    listener: _onBlocListener)),
          ),
        ),
      );

  Widget _body(StakingViewmodel viewmodel) => Column(
        children: [
          _header(viewmodel),
          Expanded(child: _buildRefreshWidget(viewmodel))
        ],
      );

  Widget _header(StakingViewmodel viewmodel) => Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 39),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.current.dig_chain,
                  style: DSTextStyle.tsMontserratT40B
                      .copyWith(color: DSColors.tulipTree),
                ),
                const SizedBox(width: 10),
                SizedBox(
                    width: 30, height: 30, child: Image.asset(AppAssets.icDig))
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTextSpan(
                        S.current.usd_format('0,0015'),
                        [
                          DSTextSpanHighlight(
                              'USD', DSTextStyle.tsMontserratT12B, null)
                        ],
                        DSTextStyle.tsMontserratT32B)
                    .format(),
                const SizedBox(width: 5),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(AppAssets.icArrowUp)),
                Text(
                  S.current.n_percent('17,6'),
                  style: DSTextStyle.tsMontserratT12M
                      .copyWith(color: DSColors.jungleGreen),
                )
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      );

  Widget _buildRefreshWidget(StakingViewmodel viewmodel) => CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return _cubit.refreshEvent();
            },
            builder: (
              BuildContext context,
              RefreshIndicatorMode refreshState,
              double pulledExtent,
              double refreshTriggerPullDistance,
              double refreshIndicatorExtent,
            ) =>
                buildDSRefreshCupertinoSliver(
                    context,
                    refreshState,
                    pulledExtent,
                    refreshTriggerPullDistance,
                    refreshIndicatorExtent),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  ((context, index) => StakingItem(
                      viewModel: viewmodel.stakingItems[index],
                      isLast: index == viewmodel.stakingItems.length - 1,
                      onTap: () {
                        _cubit
                            .tapDelegateEvent(viewmodel.validatorItems[index]);
                      })),
                  childCount: viewmodel.stakingItems.length))
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
