import 'package:rxdart/rxdart.dart';

class HListMsg {
  final BehaviorSubject<int> _hlistIdSubject = BehaviorSubject<int>.seeded(-1);
  Stream<int> get idStream => _hlistIdSubject.stream;
  void broadcastId(int id) {
    _hlistIdSubject.add(id);
  }
}
