import 'package:hello_flutter/request_api/api_path.dart';
import 'package:hello_flutter/core/http/http_index.dart';

class TeamListRequest extends WeaBaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.get;
  }

  @override
  String path() {
    return ApiPath.team_list;
  }

  @override
  Future request() async {
    dynamic data = await fireRequest();
    return data;
  }
}
