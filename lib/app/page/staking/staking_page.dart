import 'package:dig_mobile_app/app/cubit/staking/staking_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
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

class _StakingPageState extends State<StakingPage> {
  final StakingCubit _cubit = di();

  void _onBlocListener(context, state) {}

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

  Widget _buildPrimaryWidget(StakingViewmodel viewmodel) => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => _StakingItem(isLast: index == 9),
      );

  Widget _buildEmptyWidget() => const SizedBox.shrink();
}

class _StakingItem extends StatelessWidget {
  final bool isLast;
  const _StakingItem({this.isLast = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _buildTopWidget(),
          const SizedBox(height: 20),
          _buildBottomWidget(),
          if (!isLast)
            const Padding(
              padding: EdgeInsets.only(top: 23),
              child: Divider(
                color: DSColors.tulipTree,
              ),
            )
        ]),
      );

  Widget _buildTopWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                AppAssets.icAvatarEmpty,
                color: DSColors.tulipTree,
                fit: BoxFit.contain,
              )),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jane Cooper',
                  textAlign: TextAlign.start,
                  style: DSTextStyle.tsMontserratT20B
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'https://digchain.org',
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          DSSmallButton(title: 'Delegate', onTap: () {})
        ],
      );

  Row _buildBottomWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'POWER',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT16B
                      .copyWith(color: DSColors.tulipTree),
                ),
                const SizedBox(height: 1),
                Text(
                  '1593232 DIG',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT12B
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 3),
                Text(
                  '0.01%',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('COMMSION',
                    textAlign: TextAlign.center,
                    style: DSTextStyle.tsMontserratT16B
                        .copyWith(color: DSColors.tulipTree)),
                const SizedBox(height: 1),
                Text(
                  '5%',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.tsMontserratT12B
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      );
}
