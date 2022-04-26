import 'package:dig_mobile_app/app/cubit/staking/staking_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/page/staking/staking_tem.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
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
    if (state is StakingLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }

    dismissGlobalLoadingOverlay();

    if (state is StakingErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
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
                      if (state is StakingPrimaryState) {
                        return _buildPrimaryWidget(state.viewmodel);
                      }

                      return _buildEmptyWidget();
                    },
                    listener: _onBlocListener)),
          ),
        ),
      );

  Widget _buildPrimaryWidget(StakingViewmodel viewmodel) => Padding(
    padding: const EdgeInsets.only(top: 23),
    child: ListView.builder(
          itemCount: viewmodel.items.length,
          addAutomaticKeepAlives: true,
          itemBuilder: (context, index) => StakingItem(
              viewModel: viewmodel.items[index],
              isLast: index == viewmodel.items.length - 1),
        ),
  );

  Widget _buildEmptyWidget() => const SizedBox.shrink();

  @override
  bool get wantKeepAlive => true;
}
