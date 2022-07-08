import 'package:api_error_handler_demo/home_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<String>>(
        stream: homeBloc.observeItem,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('error mat tiu lion'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text((snapshot.data ?? [''])[index]),
            ),
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
    );
  }
}
