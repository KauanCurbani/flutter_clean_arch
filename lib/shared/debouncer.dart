import 'dart:async';

class Debouncer {
  Timer? _debounce;

  useDebounce(Function() fn, Duration duration) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(duration, () {
      fn();
    });
  }

  cancel() {
    _debounce?.cancel();
  }
}
