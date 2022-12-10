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
  final ScrollController scrollController = ScrollController();
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
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(5.5),
          itemCount: data.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            data[index].doa,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
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
            textAlign: TextAlign.justify,
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
