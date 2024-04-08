// ignore_for_file: prefer_collection_literals, depend_on_referenced_packages

// Dart imports:
import 'dart:collection';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:isolated_worker/isolated_worker.dart';
import 'package:isolated_worker/js_isolated_worker.dart';

const List<String> _jsScripts = <String>['fetch_put.js'];

const String _jsGetFunctionName = 'fetchPut';

class HttpHelper {
  bool _areScriptsImported = false;

  Future<LinkedHashMap<dynamic, dynamic>> put(
    String url,
    dynamic body,
  ) async {
    if (kIsWeb) {
      if (!_areScriptsImported) {
        await JsIsolatedWorker().importScripts(_jsScripts);
        _areScriptsImported = true;
      }
      final payload = LinkedHashMap<String, dynamic>();
      payload['url'] = url;
      payload['body'] = body;
      return await JsIsolatedWorker().run(
        functionName: _jsGetFunctionName,
        arguments: payload,
      ) as LinkedHashMap<dynamic, dynamic>;
    }
    return IsolatedWorker().run(
      _ioPut,
      <String, dynamic>{'url': url, 'body': body},
    );
  }
}

Future<LinkedHashMap<dynamic, dynamic>> _ioPut(
  Map<String, dynamic> payload,
) async {
  try {
    final response = await http.put(
      Uri.parse(payload['url'] as String),
      body: payload['body'],
    );
    final dynamic jsonResponse = jsonDecode(response.body);
    final result = LinkedHashMap<String, dynamic>();

    result['statusCode'] = response.statusCode;
    result['reasonPhrase'] = response.reasonPhrase;
    result['jsonResponse'] = jsonResponse;
    return result;
  } catch (error) {
    final err = LinkedHashMap<String, dynamic>();
    err['err'] = error;
    return err;
  }
}
