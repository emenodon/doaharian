import 'package:doaharian/data/models/doall.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';

class DoaDetail extends StatefulWidget {
  const DoaDetail({Key? key, required this.listDoaDetail}) : super(key: key);
  final dynamic listDoaDetail;

  @override
  _DoaDetailState createState() => _DoaDetailState();
}

class _DoaDetailState extends State<DoaDetail> {
  List<DoAll> data = [];
  DoaDetailRepo repo = DoaDetailRepo();

  getData() async {
    var hasil = await repo.getDoall(widget.listDoaDetail);

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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Doa',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        backgroundColor: Colors.deepPurple[300]!,
        body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
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
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index].doa,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
    // onTap: () => MaterialPageRoute(
    //     builder: (context) =>
    //         SecondRoute(id: _data.getId(index), name: _data.getName(index))
    //         ),
  }
}
