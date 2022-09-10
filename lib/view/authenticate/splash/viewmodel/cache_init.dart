import '../../../../core/init/cache/locale_manager.dart';

mixin CacheInit {
  Future<void> cacheInit() async {
    await Future.wait([LocaleManager.prefrencesInit()]);
  }
}
