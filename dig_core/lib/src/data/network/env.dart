import 'package:dig_core/dig_core.dart';

abstract class ENV {
  String get baseUrl;
  late final BaseEnv baseEnv;
}

class DevENV implements ENV {
  @override
  String get baseUrl => baseEnv.baseApiUrl;

  @override
  BaseEnv baseEnv;

  DevENV(this.baseEnv);
}

class ProdENV implements ENV {
  @override
  String get baseUrl => baseEnv.baseApiUrl;

  @override
  BaseEnv baseEnv;

  ProdENV(this.baseEnv);
}
