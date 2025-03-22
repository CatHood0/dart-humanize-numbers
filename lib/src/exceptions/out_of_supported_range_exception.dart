class OutOfRangeSupportedException implements Exception {
  final int value;
  final int supported;

  OutOfRangeSupportedException({
    required this.value,
    required this.supported,
  });

  @override
  String toString() {
    return 'OutOfSupportedRangeException: the value $value has a length of ${value.toString().length} that is not supported by the default length $supported';
  }
}
