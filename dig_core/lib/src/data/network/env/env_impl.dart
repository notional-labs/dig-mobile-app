import 'package:dig_core/src/data/network/env/dig_chain_impl.dart';
import 'package:dig_core/src/domain/env/env.dart';


class DevENV implements ENV {
  @override
  ChainENV get digChain => DigChainTestNet();
}

class ProdENV implements ENV {
  @override
  ChainENV get digChain => DigChainMainNet();
}
