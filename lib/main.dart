import 'package:calculadora/bloc/Operaciones/operaciones_bloc.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/screens/pantalla.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<OperacionesBloc>(create: (_) => OperacionesBloc()),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: const Pantalla(),
      theme: ThemeData( brightness: Brightness.dark),
    );
  }
}
