abstract class ENV {
  String get baseUrl;
}

class DevENV implements ENV {
  ///TODO: Impl [baseUrl]
  @override
  String get baseUrl => '';
}

class ProdENV implements ENV {
  ///TODO: Impl [baseUrl]
  @override
  String get baseUrl => '';
}
