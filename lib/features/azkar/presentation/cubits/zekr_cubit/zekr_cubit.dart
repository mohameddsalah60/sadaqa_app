import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zekr_state.dart';

class ZekrCubit extends Cubit<ZekrState> {
  ZekrCubit() : super(ZekrInitial());
}
