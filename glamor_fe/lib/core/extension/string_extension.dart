import 'package:easy_localization/easy_localization.dart';

extension ProductTitleExtension on String {
  String constrict() {
    if (length > 26) {
      return '${substring(0, 26)}...';
    }
    return this;
  }
}

extension StringLocalization on String {
  String get locale => this.tr();
}
