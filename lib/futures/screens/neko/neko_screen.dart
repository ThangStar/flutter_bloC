import 'package:bloc_app/futures/screens/neko/blocs/neko_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/neko.dart';

class NekoScreen extends StatelessWidget {
  const NekoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neko screen api with bloc"),
      ),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<NekoScreenBloc, NekoScreenState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.listNeko.length,
                itemBuilder: (context, index) {
                  Neko neko = state.listNeko[index];
                  return ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(neko.url,
                            loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return CircularProgressIndicator();
                          }
                          return child;
                        })),
                    title: Text(neko.animeName),
                    subtitle: Text(neko.url),
                  );
                },
              );
            },
          )),
          ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<NekoScreenBloc>(context)..add(LoadDataNeko()),
              child: Text("Load Data Neko"))
        ],
      ),
    );
  }
}
