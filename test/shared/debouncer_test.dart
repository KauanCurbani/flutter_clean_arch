import 'package:delivery_flutter/shared/debouncer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test(
      "when debouncer receive more than 1 call in specified duration, should call only one time",
      () async {
    int calledTimes = 0;
    Debouncer debouncer = Debouncer();

    void run() {
      debouncer.useDebounce(() {
        calledTimes = calledTimes + 1;
      }, const Duration(milliseconds: 300));
    }

    // called 2 times
    run();
    run();

    //await debouncer timer
    await Future.delayed(const Duration(milliseconds: 350));

    expect(calledTimes, 1);
  });

  test(
      "when debouncer receive more than 1 call in specified duration and call cancel, should cancel call",
      () async {
    int calledTimes = 0;
    Debouncer debouncer = Debouncer();

    void run() {
      debouncer.useDebounce(() {
        calledTimes = calledTimes + 1;
      }, const Duration(milliseconds: 300));
    }

    // called 2 times
    run();
    run();
    debouncer.cancel();

    //await debouncer timer
    await Future.delayed(const Duration(milliseconds: 350));

    expect(calledTimes, 0);
  });
}
