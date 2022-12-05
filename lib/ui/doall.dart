import 'package:doaharian/data/models/doall.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';

class Doall extends StatefulWidget {
  static const routeName = '/doall';

  const Doall({
    Key? key,
  }) : super(key: key);

  @override
  State<Doall> createState() => _DoallState();
}

class _DoallState extends State<Doall> {
  // DoaRepo client = DoaRepo();
  // DoAll? data;

  // final x = 0;

  // Future<void> getData() async {
  //   data = await client.getDoall(x);
  // }
  List<DoAll> data = [];
  DoaRepo repo = DoaRepo();

  getData() async {
    var hasil = await repo.getDoall();

    print(hasil);

    setState(() {
      data = hasil;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[300]!,
        body: ListView.builder(
          padding: const EdgeInsets.all(5.5),
          itemCount: data.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            data[index].doa,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            data[index].ayat,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          Text(
            "Artinya: " + data[index].artinya,
            style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          ),
        ]),
      ),
    );
    // onTap: () => MaterialPageRoute(
    //     builder: (context) =>
    //         SecondRoute(id: _data.getId(index), name: _data.getName(index))
    //         ),
  }
}
