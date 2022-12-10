import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/doall.dart';

class DoaRepo {
  Future<List<DoAll>> getDoall() async {
    var baseurl = Uri.parse("https://doa-doa-api-ahmadramadhan.fly.dev/api");
    final response =
        await http.get(baseurl, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List doallist = jsonDecode(response.body);
      List<DoAll> doas = [];
      for (var doaMap in doallist) {
        doas.add(DoAll.fromJson(doaMap));
      }
      return doas;
    } else {
      throw Exception('Failed to load themes');
    }
  }
}

class DoaDetailRepo {
  Future<List<DoAll>> getDoall(dynamic id) async {
    var baseurl =
        Uri.parse("https://doa-doa-api-ahmadramadhan.fly.dev/api/$id");
    final response =
        await http.get(baseurl, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List doallist = jsonDecode(response.body);
      List<DoAll> doas = [];
      for (var doaMap in doallist) {
        doas.add(DoAll.fromJson(doaMap));
      }
      return doas;
    } else {
      throw Exception('Failed to load themes');
    }
  }
}

class DoaRandomRepo {
  Future<List<DoAll>> getRandom() async {
    var baseurl = Uri.parse(
        "https://doa-doa-api-ahmadramadhan.fly.dev/api/doa/v1/random");
    final response =
        await http.get(baseurl, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List doallist = jsonDecode(response.body);
      List<DoAll> doas = [];
      for (var doaMap in doallist) {
        doas.add(DoAll.fromJson(doaMap));
      }
      return doas;
    } else {
      throw Exception('Failed to load themes');
    }
  }
}
