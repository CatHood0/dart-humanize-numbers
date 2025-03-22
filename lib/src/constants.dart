class Constants {
  const Constants._();
  static const int rangeSupported = 22;
  static final List<String> columns = List<String>.unmodifiable(
    <String>[
      "thousands", // 10^3
      "millions", // 10^6
      "billions", // 10^9
      "trillions", // 10^12
      "quadrillions", // 10^15
      "quintillions", // 10^18
    ],
  );
}
