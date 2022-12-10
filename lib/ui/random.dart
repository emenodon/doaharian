import 'package:doaharian/data/models/doall.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';

class DoaRandom extends StatefulWidget {
  static const routeName = '/doarandom';

  const DoaRandom({
    Key? key,
  }) : super(key: key);

  @override
  State<DoaRandom> createState() => _DoaRandomState();
}

class _DoaRandomState extends State<DoaRandom> {
  List<DoAll> data = []; //do not change
  DoaRandomRepo repo = DoaRandomRepo();

  getData() async {
    var hasil = await repo.getRandom();

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
          padding: const EdgeInsets.all(5.5),
          itemCount: data.length,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data[index].doa,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                data[index].ayat,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data[index].latin,
                textAlign: TextAlign.justify,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Artinya: " + data[index].artinya,
                style:
                    const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
            ]),
      ),
    );
  }
}
