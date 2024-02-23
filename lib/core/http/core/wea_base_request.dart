import 'package:hello_flutter/core/http/core/base_request.dart';
import 'package:hello_flutter/request_api/api_path.dart';

abstract class WeaBaseRequest extends BaseRequest {
  @override
  String authority() {
    return ApiPath.apiRootUrl;
  }

  Future<dynamic> request();
}
