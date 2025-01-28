import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/cubit/maincubit.dart';
import 'package:newsapp/layouts/cubit/cubit.dart';
import 'package:newsapp/layouts/newslayout.dart';
import 'package:newsapp/network/local/cach_helper.dart';
import 'package:newsapp/network/remote/diohelper.dart';
import 'package:newsapp/shared/blocobserver.dart';
import 'package:newsapp/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusinessData(),
        ),
        BlocProvider(
          create: (context) => MainCubit(),
        )
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blue,
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Colors.white,
                    ),
                    appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                      ),
                      backgroundColor: Colors.blue,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                    ),
                    textTheme:
                        TextTheme(titleMedium: TextStyle(color: Colors.white))),
                darkTheme: ThemeData(
                    scaffoldBackgroundColor: Colors.grey[900],
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: myyellow,
                      unselectedItemColor: Colors.grey,
                      backgroundColor: Colors.black,
                    ),
                    appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                        color: myyellow,
                        fontSize: 24.sp,
                      ),
                      backgroundColor: Colors.black,
                      iconTheme: IconThemeData(
                        color: myyellow,
                      ),
                    ),
                    textTheme:
                        TextTheme(titleMedium: TextStyle(color: Colors.white))),
                themeMode: CachHelper.getdata(key: "isdark")
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: Newslayout(),
              );
            },
          );
        },
      ),
    );
  }
}
