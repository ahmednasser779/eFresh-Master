import 'package:bloc/bloc.dart';
import 'package:efresh/layouts/home_layout.dart';
import 'package:efresh/shared/bloc/app_cubit.dart';
import 'package:efresh/shared/bloc/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eFresh',
        theme: ThemeData(
          primaryColor: Colors.lightGreen,
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.white
        ),
        home: HomeLayout(),
      ),
    );
  }
}
