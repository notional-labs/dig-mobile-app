import 'package:dig_mobile_app/app/cubit/active_account/active_account_cubit.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_rounded_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_expandable_page_view.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:dig_mobile_app/app/page/active_account/real_estate_list_tab_page/real_estate_list_tab_page.dart';
import 'package:dig_mobile_app/app/page/active_account/tokens_holding_list_tab_page/tokens_holding_list_tab_page.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class ActiveAccountPage extends StatefulWidget {
  final AccountPublicInfo accountPublicInfo;

  const ActiveAccountPage({required this.accountPublicInfo, Key? key})
      : super(key: key);

  @override
  State<ActiveAccountPage> createState() => _ActiveAccountPageState();
}

class _ActiveAccountPageState extends State<ActiveAccountPage>
    with SingleTickerProviderStateMixin, WidgetUtil {
  final ActiveAccountCubit _cubit = di();
  final PageController _pageController = PageController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActiveAccountCubit, ActiveAccountState>(
      bloc: _cubit,
      listener: _cubitListener,
      builder: (context, state) => _buildBody(state.model),
    );
  }

  void _cubitListener(_, state) {}

  Widget _buildBody(ActiveAccountViewModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: DSAvatar(
              backgroundColor: DSColors.silver2,
            ),
          ),
          Text(
            widget.accountPublicInfo.name,
            style: DSTextStyle.tsMontserrat.copyWith(
                color: DSColors.tulipTree,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '\$000',
            style: DSTextStyle.tsMontserrat.copyWith(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),
          _WalletAddress(address: widget.accountPublicInfo.publicAddress),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 54, right: 54, bottom: 34),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DSRoundedButton(
                  actionType: DSRoundedButtonActionType.buy,
                ),
                const DSRoundedButton(
                  actionType: DSRoundedButtonActionType.send,
                ),
                const DSRoundedButton(
                  actionType: DSRoundedButtonActionType.exchange,
                ),
                DSRoundedButton(
                  actionType: DSRoundedButtonActionType.remove,
                  onTap: () {
                    showActionDialog(
                        context: context,
                        title: S.current.remove_account,
                        message: S.current
                            .are_you_sure_you_want_to_remove_this_account,
                        leftActTitle: S.current.cancel,
                        rightActTitle: S.current.remove,
                        onLeftTap: () {
                          Navigator.of(context).pop();
                        },
                        onRightTap: () {
                          _cubit.removeAccount(widget.accountPublicInfo);
                        });
                  },
                )
              ],
            ),
          ),
          _buildTab(model)
        ],
      ),
    );
  }

  Widget _buildTab(ActiveAccountViewModel model) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic);
              });
            },
            indicatorColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(
                child: _TabItem(
                  text: S.current.token,
                  isSelected: _tabController.index == 0,
                ),
              ),
              Tab(
                child: _TabItem(
                  text: S.current.real_estate,
                  isSelected: _tabController.index == 1,
                ),
              ),
            ],
          ),
          DSExpandablePageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _tabController.animateTo(index);
              });
            },
            children: const [
              TokensHoldingListTabPage(),
              RealEstateListTabPage(),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _TabItem({required this.text, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: 106,
      decoration: BoxDecoration(
        color: isSelected ? DSColors.tulipTree : DSColors.silver2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        text,
        style: DSTextStyle.tsMontserrat.copyWith(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
      )),
    );
  }
}

class _WalletAddress extends StatelessWidget {
  final String address;

  const _WalletAddress({required this.address, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 86),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: DSColors.silver2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              address.length > 20 ? address.trimMiddleWithDot(20) : address,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: DSTextStyle.tsMontserrat.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: DSColors.tundora,
                  overflow: TextOverflow.clip),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            AppAssets.icCopy,
            width: 18,
            height: 18,
          )
        ],
      ),
    );
  }
}
