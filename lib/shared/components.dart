import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildarticlerow({required model}) {
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
                    image: CachedNetworkImageProvider('${model["urlToImage"]}',),
                    fit: BoxFit.cover,)),
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
                    child: Text(
                      "${model["title"]}",
                      style: TextStyle(color: Colors.yellow, fontSize: 20.sp),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
