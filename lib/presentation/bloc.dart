import 'dart:async';

import 'package:rxdart/subjects.dart';

abstract class Bloc {
  final subjects = <Subject>{};
  final subscriptions = <StreamSubscription>{};

  void init() {}

  Future<void> dispose() async {
    for (var subscription in subscriptions) {
      await subscription.cancel();
    }
    for (var subject in subjects) {
      await subject.close();
    }
  }

  BehaviorSubject<T> createBehaviorSubject<T>(void Function(T value)? onData) {
    BehaviorSubject<T> _actionSubject = BehaviorSubject();
    subjects.add(_actionSubject);
    final subscription = _actionSubject.listen(onData);
    subscriptions.add(subscription);
    return _actionSubject;
  }
}
