import 'package:meta/meta.dart';

/// Internal state container used to maintain contextual information during
/// number humanization process.
///
/// This class is for internal library use only and should not be used directly.
@internal
class HumanizeContext {
  /// The value of the next number group in the processing sequence
  int nextGroup;

  /// Current position in the column-based number grouping system
  int currentColumnIndex;

  /// Total number of columns (groups) in the current number
  int totalColumns;

  /// Flag to control connector usage between number groups
  bool ignoreNextConnector = false;

  /// Creates a context with initial values
  HumanizeContext({
    this.nextGroup = -1,
    this.currentColumnIndex = -1,
    this.totalColumns = -1,
  });

  /// Resets all context values to their initial state
  @internal
  @experimental
  void regenerateContext() {
    nextGroup = -1;
    currentColumnIndex = -1;
    totalColumns = -1;
    ignoreNextConnector = false;
  }
}
