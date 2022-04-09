import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

class HomeViewmodel extends Equatable {
  final AccountPublicInfo? account;
  final List<AccountPublicInfo> accounts;

  AccountPublicInfo get getAccount => account!;

  const HomeViewmodel({
    this.account,
    this.accounts = const [],
  });

  HomeViewmodel copyWith({
    AccountPublicInfo? account,
    List<AccountPublicInfo>? accounts,
  }) {
    return HomeViewmodel(
      account: account ?? this.account,
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [account, accounts];
}
