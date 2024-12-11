import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'products/products_api.dart';

class Network {
  static const String _baseUrl = "https://dummyjson.com";

  static late final http.Client _client;

  static Future<Network> create() async {
    _client = http.Client();

    return Network();
  }

  Future<Map<String, dynamic>> getResponse({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    try {
      // Create a base URI for the request.
      final baseUri = Uri.parse(
        '$_baseUrl$endpoint',
      );

      // Add query parameters, if any.
      final parameters = _getQueryParameters(
        baseUri: baseUri,
        queryParameters: queryParameters,
      );

      final response = await _client.get(
        parameters,
        headers: headers,
      );

      return _handleResponse(
        response: response,
      );
    } catch (exception) {
      throw Exception(
        'Error fetching data: $exception.',
      );
    }
  }

  void registrationApiSingletons() {
    GetIt.instance.registerSingleton(
      ProductsApi(),
    );
  }

  // Method for adding query parameters to the URI.
  Uri _getQueryParameters({
    required Uri baseUri,
    required Map<String, String>? queryParameters,
  }) {
    return baseUri.replace(
      queryParameters: queryParameters,
    );
  }

  // A method to handle the response from the server.
  Map<String, dynamic> _handleResponse({
    required http.Response response,
  }) {
    if (response.statusCode == 200) {
      return json.decode(
        response.body,
      );
    } else {
      throw Exception(
        'Failed to load data: ${response.statusCode}.',
      );
    }
  }
}
