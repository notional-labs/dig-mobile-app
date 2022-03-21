import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/data/network/chain/dig_chain.dart';

abstract class ENV {
  String get baseUrl;
  ChainENV get digChain;

  /// Define other chain:
  /// ChainENV get cosmosChain;
}

class DevENV implements ENV {
  @override
  String get baseUrl => '';

  @override
  ChainENV get digChain => DigChainTestNet();
}

class ProdENV implements ENV {
  @override
  String get baseUrl => '';

  @override
  ChainENV get digChain => DigChainMainNet();
}
