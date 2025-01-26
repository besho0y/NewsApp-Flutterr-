import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/cubit.dart';
import 'package:newsapp/layouts/cubit/state.dart';
import 'package:newsapp/shared/components.dart';

class Businessscreen extends StatelessWidget {
  const Businessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List business = NewsCubit.get(context).business;
    return BlocConsumer<NewsCubit, Newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: business.isNotEmpty,
            builder: (context) => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildarticlerow(
                    model: NewsCubit.get(context).business[index],
                  ),
                  itemCount: business.length,
                ),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
