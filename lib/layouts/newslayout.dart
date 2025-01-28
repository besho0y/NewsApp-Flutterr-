import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/maincubit.dart';
import 'package:newsapp/layouts/cubit/cubit.dart';
import 'package:newsapp/layouts/cubit/state.dart';
import 'package:newsapp/moduls/search/searchScreen.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Searchscreen()));
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  MainCubit.get(context).changemode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
          body: ConditionalBuilder(
            condition: state is! NewsLoadingState,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
