import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/cubit/maincubit.dart';
import 'package:newsapp/moduls/webview/webview_screen.dart';

Widget buildarticlerow(model, context) {
  return InkWell(
    child: BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
                color: MainCubit.get(context).isdark
                    ? Colors.lightBlue[900] 
                    :Colors.grey[800] ,
                borderRadius: BorderRadius.circular(20.r)),
            child: Row(
              children: [
                Container(
                  height: 100.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: model["urlToImage"] != null
                          ? CachedNetworkImageProvider('${model["urlToImage"]}')
                          : AssetImage(
                              'images/placeholder.png'), // Provide a placeholder image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 100.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Text(
                              "${model["title"]}",
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text("${model["publishedAt"]}",
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 12.sp)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebviewScreen(url: model["url"])));
    },
  );
}

Widget articlebuilder(list, {issearch = false}) {
  return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildarticlerow(list[index], context),
            itemCount: list.length,
          ),
      fallback: (context) => issearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ));
}
