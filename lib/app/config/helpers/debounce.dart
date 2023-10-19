import 'dart:async';

// Track all your pending function calls
Map<Function, Timer> _timeouts = {};

/// The `debounce` function in Dart allows you to delay the execution of a function by a specified duration, and cancel any
/// previous pending executions.
///
/// Args:
///   timeout (Duration): The timeout parameter is of type Duration and represents the amount of time to wait before
/// executing the target function.
///   target (Function): The "target" parameter is a function that you want to debounce. It is the function that will be
/// called after the debounce timeout has elapsed.
///   arguments (List): The `arguments` parameter is an optional parameter that allows you to pass a list of arguments to
/// the `target` function when it is called. By default, it is set to an empty list (`const []`), which means that if no
/// arguments are provided, the `target` function will be. Defaults to const []
void debounce(Duration timeout, Function target, [List arguments = const []]) {
  if (_timeouts.containsKey(target)) {
    _timeouts[target]?.cancel();
  }

  Timer timer = Timer(timeout, () {
    Function.apply(target, arguments);
  });

  _timeouts[target] = timer;
}
