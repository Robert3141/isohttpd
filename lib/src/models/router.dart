import 'dart:io';

import 'package:meta/meta.dart';

import '../logger.dart';
import '../types.dart';

/// The http routed
class IsoRouter {
  /// Default constructor
  IsoRouter(this.routes);

  /// The available routes
  List<IsoRoute> routes;
}

/// Http route
class IsoRoute {
  /// If not [handler] is provided it will just print the request
  static Future<HttpResponse> _defaultHandler(
      HttpRequest request, IsoLogger logSink) async {
    print("Request: ${request.uri}");
    return request.response;
  }

  IsoRoute({required this.path, this.handler = _defaultHandler});

  /// The url path
  final String path;

  /// The requests handler
  IsoRequestHandler handler;
}
