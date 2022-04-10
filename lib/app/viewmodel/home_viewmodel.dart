import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

enum CurrentHomePage { activeAccount, staking, proposals }

class HomeViewModel extends Equatable {
  final AccountPublicInfo? account;
  final List<AccountPublicInfo> accounts;
  final CurrentHomePage currentHomePage;

  AccountPublicInfo get getAccount => account!;

  const HomeViewModel(
      {this.account,
      this.accounts = const [],
      this.currentHomePage = CurrentHomePage.activeAccount});

  HomeViewModel copyWith({
    AccountPublicInfo? account,
    List<AccountPublicInfo>? accounts,
    CurrentHomePage? currentHomePage
  }) {
    return HomeViewModel(
      account: account ?? this.account,
      accounts: accounts ?? this.accounts,
      currentHomePage: currentHomePage ?? this.currentHomePage
    );
  }

  @override
  List<Object?> get props => [account, accounts, currentHomePage];
}
