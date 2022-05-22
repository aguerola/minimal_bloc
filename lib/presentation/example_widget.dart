import 'package:flutter/material.dart';
import 'package:minimal_bloc/presentation/bloc.dart';
import 'package:minimal_bloc/presentation/stateful_bloc_widget.dart';

class HolaPage extends StatefulBlocWidget<HolaBloc> {
  const HolaPage(BlocBuilder<HolaBloc> blocBuilder,  {Key? key}) : super(blocBuilder, key: key);

  @override
  State<HolaPage> createState() => _HolaPageState();
}

class _HolaPageState extends BlocWidgetState<HolaPage, HolaBloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HolaBloc extends Bloc {
  @override
  void init() {}

  @override
  Future<void> dispose() async {}
}

void f() {
  HolaPage(() => HolaBloc());
}


class MyFinalTestPage extends StatefulBlocWidget<HolaBloc> {
  const MyFinalTestPage(BlocBuilder<HolaBloc> blocBuilder, {Key? key}) : super(blocBuilder, key: key);

  @override
  State<MyFinalTestPage> createState() => _MyFinalTestState();
}

class _MyFinalTestState extends BlocWidgetState<MyFinalTestPage, HolaBloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyFinalTestBloc extends Bloc {

  late Sink<Action> actionSink;


  @override
  void init() {

    actionSink = createBehaviorSubject<Action>((value) {
      switch(value){

        case Action.action1:
          // TODO: Handle this case.
          break;
        case Action.action2:
          // TODO: Handle this case.
          break;
      }
    });

  }

  @override
  Future<void> dispose() async {}
}

enum Action {action1, action2}