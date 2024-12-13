import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

      final response = await _client
        .get(
          parameters,
          headers: headers,
        ).timeout(
          const Duration(
            seconds: 60,
          ),
        );

      return _handleResponse(
        response: response,
      );
    } catch (exception) {
      _handleError(
        exception: exception,
      );
      rethrow;
    }
  }

  void registrationApiSingletons() {
    GetIt.instance.registerSingleton(
      ProductsApi(),
    );
  }

  // A method for adding query parameters to the URI.
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
    } else if (response.statusCode == 404) {
      throw ServerException(
        response.statusCode,
      );
    } else {
      throw Exception(
        'Unidentified server error.',
      );
    }
  }

  // Handles potential errors, that can occur during network requests.
  void _handleError({
    required dynamic exception,
  }) {
    if (exception is SocketException) {
      throw NetworkException(
        'Check the internet connection.',
      );
    } else if (exception is http.ClientException) {
      throw Exception(
        'Error fetching data: ${exception.message}.',
      );
    } else if (exception is TimeoutException) {
      throw NetworkException(
        'The time to wait for a response from the server has been exceeded.',
      );
    } else {
      throw NetworkException(
        'An unknown error occurred: $exception.',
      );
    }
  }
}

class NetworkException implements Exception {
  final String message;

  NetworkException(
    this.message,
  );
}

class ServerException implements Exception {
  final int statusCode;

  ServerException(
    this.statusCode,
  );
}
