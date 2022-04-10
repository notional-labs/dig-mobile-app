import 'package:dig_mobile_app/app/cubit/home/home_cubit.dart';
import 'package:dig_mobile_app/app/cubit/home/home_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/active_account/active_account_page.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposals/proposals_page.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/home_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetUtil {
  final HomeCubit _cubit = di();

  void _cubitListener(context, state) {
    if (state is HomeErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _cubit.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          drawer: HomeDrawer(
            onProposalsTap: () =>
                _cubit.changeHomePage(CurrentHomePage.proposals),
          ),
          body: DSBackground(
            child: SafeArea(
              child: BlocProvider(
                  create: (_) => _cubit,
                  child: BlocConsumer<HomeCubit, HomeState>(
                    listener: _cubitListener,
                    bloc: _cubit,
                    builder: (BuildContext context, state) {
                      if (state is HomePrimaryState) {
                        return _bodyWidget(state.viewModel);
                      }
                      if (state is HomeErrorState) {
                        return _errorWidget(state);
                      }

                      return const SizedBox.shrink();
                    },
                  )),
            ),
          )),
    );
  }

  Widget _errorWidget(HomeErrorState state) => Center(
        child: Text(
          state.exception.message,
          textAlign: TextAlign.center,
          style: DSTextStyle.tsMontserratT16M.copyWith(color: Colors.white),
        ),
      );

  Widget _bodyWidget(HomeViewModel viewModel) => Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: _mapCurrentHomePage(viewModel),
          )
        ],
      );

  Widget _mapCurrentHomePage(HomeViewModel viewModel) {
    switch (viewModel.currentHomePage) {
      case CurrentHomePage.activeAccount :
        return ActiveAccountPage(
          accountPublicInfo: viewModel.getAccount,
        );
      case CurrentHomePage.staking:
        return const SizedBox.shrink();
      case CurrentHomePage.proposals :
        return const ProposalsPage();
    }
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: DSColors.tulipTree,
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              const Icon(
                Icons.notifications,
                color: DSColors.tulipTree,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                AppAssets.icScanQr,
                width: 18,
                height: 18,
              ),
              const SizedBox(
                width: 32,
              ),
            ],
          )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.icDigLogo,
              width: 37,
              height: 27,
            ),
          )
        ],
      ),
    );
  }
}
