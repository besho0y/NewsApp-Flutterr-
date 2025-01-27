import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/cubit.dart';
import 'package:newsapp/layouts/cubit/state.dart';
import 'package:newsapp/shared/components.dart';

class Sportscreen extends StatelessWidget {
  const Sportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return articlebuilder(list);
      },
    );
  }
}
