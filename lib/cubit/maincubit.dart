import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/local/cach_helper.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MaincubitInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  bool isdark = false;
  void changemode() {
    isdark = !isdark;
    CachHelper.putdata(key: "isdark", value: isdark).then((value){
      emit(MainChangeMode());
    });
    
  }
}
