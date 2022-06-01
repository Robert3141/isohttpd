import 'dart:isolate';

/// The logger
class IsoLogger {
  /// Default constructor
  IsoLogger({required this.chan});

  /// The port to use
  final SendPort chan;

  /// Push something to the logs
  void push(dynamic obj) => chan.send(obj);
}
