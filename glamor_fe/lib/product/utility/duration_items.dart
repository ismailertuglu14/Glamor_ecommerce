class DurationItems extends Duration {
  DurationItems.durationLow() : super(milliseconds: 500);
  DurationItems.durationNormal() : super(seconds: 1);
  DurationItems.durationHigh() : super(seconds: 3);
  DurationItems.durationUltra() : super(seconds: 5);
}
