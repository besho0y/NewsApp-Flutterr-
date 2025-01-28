import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/cubit/maincubit.dart';
import 'package:newsapp/layouts/cubit/cubit.dart';
import 'package:newsapp/layouts/cubit/state.dart';
import 'package:newsapp/shared/components.dart';
import 'package:newsapp/shared/constants.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchcontroller = TextEditingController();
    return BlocConsumer<NewsCubit, Newsstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: TextFormField(
                  cursorColor: MainCubit.get(context).isdark
                            ? Colors.black
                            : myyellow ,
                  style: TextStyle(
                      color: MainCubit.get(context).isdark
                          ? Colors.black
                          : myyellow,
                      fontSize: 16.sp),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainCubit.get(context).isdark
                        ? Colors.white
                        : Colors.blueGrey[800],
                    label: Text(
                      "search",
                      style: TextStyle(
                        color: MainCubit.get(context).isdark
                            ? Colors.black
                            : myyellow,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: Icon(
                      Icons.search,
                      color: MainCubit.get(context).isdark
                          ? Colors.black
                          : myyellow,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      borderSide: BorderSide(
                        color: MainCubit.get(context).isdark
                            ? Colors.blue
                            : myyellow, // Border color when inactive
                        width: 2.0, // Border width
                      ),
                    ),
                    // Focused border (active state)
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      borderSide: BorderSide(
                        color: MainCubit.get(context).isdark
                            ? Colors.blue
                            : myyellow, // Border color when focused
                        width: 2.5, // Border width
                      ),
                    ),
                  ),
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Expanded(child: articlebuilder(list))
            ],
          ),
        );
      },
    );
  }
}
