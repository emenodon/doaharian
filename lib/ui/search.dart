import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/models/doall.dart';
import 'detail.dart';

class DoaSearch extends StatefulWidget {
  const DoaSearch({super.key});

  @override
  State<DoaSearch> createState() => _DoaSearchState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _DoaSearchState extends State<DoaSearch> {
  final _debouncer = Debouncer();

  List<DoAll> dlist = [];
  List<DoAll> doaLists = [];
  //API call for All Subject List

  String url = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  Future<List<DoAll>> getAlldoaList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<DoAll> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<DoAll> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DoAll>((json) => DoAll.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAlldoaList().then((subjectFromServer) {
      setState(() {
        dlist = subjectFromServer;
        doaLists = dlist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: const InkWell(
                    highlightColor: Colors.white,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Search ',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  )),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    doaLists = dlist
                        .where(
                          (u) => (u.doa.toLowerCase().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              itemCount: doaLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.deepPurple[300]!,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                            title: Text(
                              doaLists[index].doa,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              doaLists[index].ayat ?? "null",
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoaDetail(
                                        listDoaDetail: doaLists[index].id),
                                  ));
                            }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
