import 'package:dig_mobile_app/app/cubit/staking/staking_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_refresh_cupertino_sliver.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/page/staking/delegate/delegate_widget.dart';
import 'package:dig_mobile_app/app/page/staking/staking_tem.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
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
                      return _buildRefreshWidget(state.viewmodel);
                    },
                    listener: _onBlocListener)),
          ),
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
