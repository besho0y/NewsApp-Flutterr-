import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildarticlerow(model, context) {
  return Padding(
    padding: EdgeInsets.all(10.w),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(20.r)),
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
                      style:
                          TextStyle(color: Colors.grey[300], fontSize: 12.sp)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articlebuilder(list) {
  return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildarticlerow(list[index], context),
            itemCount: list.length,
          ),
      fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ));
}
