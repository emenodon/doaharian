import 'package:doaharian/data/models/doall.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';

//ganti class Doall jadi DoaRandom
class Doall extends StatefulWidget {
  static const routeName = '/doall';

  const Doall({
    //ganti Doall jadi DoaRandom
    Key? key,
  }) : super(key: key);

  @override
  State<Doall> createState() =>
      _DoallState(); //ganti <Doall> jadi <DoaRandom> dan _DoallState jadi _DoaRandom
}

//ganti <Doall> dibawah jadi <DoaRandom> dan _DoallState jadi _DoaRandom
class _DoallState extends State<Doall> {
  List<DoAll> data = []; //do not change
  //ganti dibawah ini pake repo random api.dart
  DoaRepo repo = DoaRepo();

  getData() async {
    //repo.getDoall() ganti pake punyanya random cek di api.dart
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
    //tampilan card dibawah bisa kamu ubah2 explore aja
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
          //buat nampilin judul doa
          Text(
            data[index].doa,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          //buat nampilin ayat
          Text(
            data[index].ayat,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          //buat nampilin artinya
          Text(
            "Artinya: " + data[index].artinya,
            style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          ),
        ]),
      ),
    );
  }
}
