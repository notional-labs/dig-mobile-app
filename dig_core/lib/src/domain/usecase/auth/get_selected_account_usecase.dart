import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

@Injectable()
class GetSelectedAccountUseCase
    extends UseCase<AccountPublicInfo, GetSelectedAccountUseCaseParam> {
  final AuthRepository _repository;

  GetSelectedAccountUseCase(this._repository);

  @override
  Future<Either<BaseDigException, AccountPublicInfo>> call(
      GetSelectedAccountUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain);
      final accounts = await _repository.getAccountList();
      if (accounts.isEmpty) {
        return Left(exceptionHandler.handler(Exception('No account found')));
      }
      // todo get selected account from cache
      return Right(accounts.first);
    } catch (e, trace) {
      Logger().e('GetSelectedAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetSelectedAccountUseCaseParam {
  final ChainENV chain;

  const GetSelectedAccountUseCaseParam({required this.chain});
}
