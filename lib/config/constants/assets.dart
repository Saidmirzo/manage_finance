abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  // String get logo => "$basePath/logo.svg";
  String get home => "$basePath/home.svg";

  String get addStudent => "$basePath/Food.svg";

  String get settings => "$basePath/Nevigate.svg";

  String get profile => "$basePath/profile.svg";

  String get add => "$basePath/add_ic.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get user1 => '$basePath/user1.jpg';
}
