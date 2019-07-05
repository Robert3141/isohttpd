# Isohttpd

A lightweight http server that runs in an isolate

*Warning*: this is experimental and the api may change.

## Example

   ```dart
   import 'dart:io';
   import 'dart:async';
   import 'package:isohttpd/isohttpd.dart';

   Future<HttpResponse> handler(HttpRequest request, IsoLogger log) async {
     return jsonResponse(request, {"response": "ok"});
   }

   void main() async {
     // set routes
     final defaultRoute = IsoRoute(path: "*", handler: handler);
     final routes = <IsoRoute>[defaultRoute];
     final router = IsoRouter(routes);

     // run
     final iso = IsoHttpdRunner(host: "localhost", router: router);
     await iso.run(verbose: true);

     // listen to logs
     iso.logs.listen((dynamic data) => print("$data"));
     iso.requestLogs.listen((dynamic data) => print("REQUEST $data"));
     // idle
     final waiter = Completer<Null>();
     await waiter.future;
   }
   ```
