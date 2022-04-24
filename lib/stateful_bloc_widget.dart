import 'package:flutter/widgets.dart';
import 'package:minimal_bloc/bloc.dart';


abstract class StatefulBlocWidget<B extends Bloc> extends StatefulWidget {
  final BlocBuilder<B> blocBuilder;

  const StatefulBlocWidget(this.blocBuilder, {Key? key}): super(key: key);
}

abstract class BlocWidgetState<W extends StatefulBlocWidget<B>, B extends Bloc> extends State<W> {
  late B bloc;

  BlocWidgetState();

  @override
  void initState() {
    bloc = widget.blocBuilder();
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

typedef BlocBuilder<B> = B Function();