// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GymService implements GymService {
  _GymService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AddressGymList> getGymList(
    String accessToken,
    int user_id,
    String gym_name,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'gym_name': gym_name};
    final _headers = <String, dynamic>{
      r'Authorization': accessToken,
      r'user-id': user_id,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressGymList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/gyms',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddressGymList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddressGymList> registerGym(
    int user_id,
    String accessToken,
    GymId gym_id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'user-id': user_id,
      r'Authorization': accessToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(gym_id.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddressGymList>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/gyms',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddressGymList.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
