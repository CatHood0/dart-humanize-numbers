/// An internal object that allow to us create a final value
/// that can mutate its state without affect to the class that
/// wrap this value
class ObjectValue<T> {
  T value;
  ObjectValue({
    required this.value,
  });

  @override
  bool operator ==(covariant ObjectValue<T> other) {
    return value == other.value;
  }

  @override
  String toString() {
    return value.toString();
  }

  @override
  int get hashCode => value.hashCode;
}
