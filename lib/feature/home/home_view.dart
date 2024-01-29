import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_servisci_app/product/models/news.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference news = FirebaseFirestore.instance.collection('news');

    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirabase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Placeholder();
            case ConnectionState.waiting:
              return const LinearProgressIndicator();
            case ConnectionState.active:
              return const LinearProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                final values = snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            values[index]?.image ?? '',
                            height: 2,
                          ),
                          Text(values[index]?.title ?? ''),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
          }
        },
      ),
    );
  }
}
