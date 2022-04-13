import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';


class HomeViewModel extends Equatable {
  final AccountPublicInfo? account;
  final List<AccountPublicInfo> accounts;
  final DrawerMenu currentDrawerMenu;

  AccountPublicInfo get getAccount => account!;

  const HomeViewModel(
      {this.account,
      this.accounts = const [],
      this.currentDrawerMenu = DrawerMenu.account});

  HomeViewModel copyWith({
    AccountPublicInfo? account,
    List<AccountPublicInfo>? accounts,
    DrawerMenu? currentHomePage
  }) {
    return HomeViewModel(
      account: account ?? this.account,
      accounts: accounts ?? this.accounts,
      currentDrawerMenu: currentHomePage ?? this.currentDrawerMenu
    );
  }

  @override
  List<Object?> get props => [account, accounts, currentDrawerMenu];
}
