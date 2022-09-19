extension ProductTitleExtension on String {
  String constrict() {
    if (length > 26) {
      return '${substring(0, 26)}...';
    }
    return this;
  }
}
