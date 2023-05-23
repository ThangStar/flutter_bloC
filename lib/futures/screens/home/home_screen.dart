import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreenBloc homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return Text("counter: ${state.counter}");
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => homeScreenBloc.add(PlusSizeList()),
      child: Icon(Icons.plus_one),),
    );
  }
}
