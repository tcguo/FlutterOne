import 'package:hello_flutter/extensions/safe_getter.dart';
import 'package:hello_flutter/request_api/team_list_request.dart';
import 'package:hello_flutter/utils/ImageResUtils.dart';

abstract class NBATeamProvider {
  int? get teamId;

  String? get abbr;

  String? get name;

  String get logo => ImageResUtils.teamLogo(abbr ?? '');
}

abstract class NBATeamSectionProvider {
  String? get name;

  List<NBATeamProvider>? get teams;
}

class NBATeamListItem with SafeAble, NBATeamProvider {
  @override
  dynamic data;

  NBATeamListItem.withData(this.data);

  @override
  String? get abbr => safeString("Abbr");

  @override
  String? get name => safeString("Name");

  @override
  int? get teamId => getNum("TeamID")?.toInt();
}

class NBATeamConferences with SafeAble, NBATeamSectionProvider {
  @override
  dynamic data;
  List<NBATeamListItem> conferencesTeams = [];
  String conferencesName = "";

  NBATeamConferences.withData(this.data) {
    conferencesName = safeString("name");
    var divisions = safeList("divisions");
    for (var division in divisions) {
      var teams = division.getList("teams");
      var list = teams.map((e) => NBATeamListItem.withData(e)).toList();
      conferencesTeams.addAll(list);
    }
  }

  @override
  String? get name => safeString("name");

  @override
  List<NBATeamProvider>? get teams => conferencesTeams;
}

class TeamListViewModel {
  TeamListRequest? _request;

  void requestTeamList() async {
    try {
      _request = TeamListRequest();
      dynamic data = await _request?.request();
      var safeAbleData = SafeAbleData(data);
      var conferences =
          safeAbleData.safeData("data")?.getList("conferences") ?? [];
      var data1 = conferences
          .map((conference) => NBATeamConferences.withData(conference))
          .toList();
      print(conferences);
    } catch (e) {}
  }
}
