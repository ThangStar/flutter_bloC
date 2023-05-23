import 'package:bloc_app/futures/screens/detail/blocs/detail_screen_bloc.dart';
import 'package:bloc_app/futures/screens/home/home_screen.dart';
import 'package:bloc_app/futures/screens/neko/blocs/neko_screen_bloc.dart';
import 'package:bloc_app/futures/screens/neko/neko_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'futures/screens/detail/detail_screen.dart';
import 'futures/screens/home/blocs/home_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter demo"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => HomeScreen())),
                    child: const Text("Counter")),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => DetailScreen())),
                    child: const Text("ListView")),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => NekoScreen())),
                    child: const Text("Neko api bloc"))
              ],
            ))
    );
  }
}

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeScreenBloc(),
      ),
      BlocProvider(
        create: (context) => DetailScreenBloc(),
      ),
      BlocProvider(
        create: (context) => NekoScreenBloc(),
      ),
    ],
    child: MaterialApp(
        title: "title",
        home: MainScreen()
    ),
  ));
}
