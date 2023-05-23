import 'package:bloc_app/futures/screens/detail/blocs/detail_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    DetailScreenBloc detailScreenBloc =
        BlocProvider.of<DetailScreenBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail screen"),
      ),
      body: Column(
        children: [
          BlocBuilder<DetailScreenBloc, DetailScreenState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.listUser.length,
                  itemBuilder: (context, index) {
                    User user = state.listUser[index];
                    return ListTile(
                      title: Text("${user.name}"),
                      leading: Icon(Icons.leaderboard_outlined),
                    );
                  },
                ),
              );
            },
          ),
          ElevatedButton(
              onPressed: () => detailScreenBloc.add(OnUpdataData()),
              child: Text("Update at 0")),
          ElevatedButton(
              onPressed: () => detailScreenBloc.add(OnRemoveData()),
              child: Text("Remove at 0")),

          ElevatedButton(
              onPressed: () => detailScreenBloc.add(OnSendIndex(index: 20)),
              child: Text("SendIndex")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async => detailScreenBloc.add(OnSetData()),
          child: Icon(Icons.plus_one)),
    );
  }
}
