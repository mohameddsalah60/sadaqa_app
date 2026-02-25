import 'package:bloc/bloc.dart';
import 'package:sadaqa_app/features/azkar/domin/entites/azkar_entity.dart';

part 'zekr_state.dart';

class ZekrCubit extends Cubit<ZekrState> {
  ZekrCubit({required List<AzkarEntity> azkarList})
    : _azkarList = azkarList,
      super(ZekrInitial()) {
    _initializeCounts();
  }

  final List<AzkarEntity> _azkarList;
  late List<int> _currentCounts;
  int _currentPageIndex = 0;

  List<AzkarEntity> get azkarList => _azkarList;
  List<int> get currentCounts => _currentCounts;
  int get currentPageIndex => _currentPageIndex;
  void _initializeCounts() {
    _currentCounts = List.filled(_azkarList.length, 0);
  }

  void incrementCount(int index) {
    if (index < 0 || index >= _azkarList.length) return;

    final maxCount = _azkarList[index].count;
    final newCount = _currentCounts[index] + 1;

    if (newCount <= maxCount) {
      _currentCounts[index] = newCount;
      emit(
        ZekrCountUpdated(
          index: index,
          currentCount: newCount,
          maxCount: maxCount,
        ),
      );

      // Check if completed and move to next
      if (newCount >= maxCount) {
        _checkAndMoveToNext(index);
      }
    }
  }

  void _checkAndMoveToNext(int completedIndex) {
    if (completedIndex + 1 < _azkarList.length) {
      _currentPageIndex = completedIndex + 1;
      emit(
        ZekrPageChanged(
          pageIndex: _currentPageIndex,
          completedIndex: completedIndex,
        ),
      );
    }
  }

  void setPageIndex(int index) {
    if (index >= 0 && index < _azkarList.length) {
      _currentPageIndex = index;
    }
  }

  void resetAllCounts() {
    _initializeCounts();
    _currentPageIndex = 0;
    emit(ZekrResetAll());
  }

  void resetCurrentZekr(int index) {
    if (index >= 0 && index < _azkarList.length) {
      _currentCounts[index] = 0;
      emit(
        ZekrCountUpdated(
          index: index,
          currentCount: 0,
          maxCount: _azkarList[index].count,
        ),
      );
    }
  }

  double getProgressForIndex(int index) {
    if (index < 0 || index >= _azkarList.length) return 0.0;
    final maxCount = _azkarList[index].count;
    return maxCount > 0 ? _currentCounts[index] / maxCount : 0.0;
  }

  bool isZekrCompleted(int index) {
    if (index < 0 || index >= _azkarList.length) return false;
    return _currentCounts[index] >= _azkarList[index].count;
  }

  int getRemainingCount(int index) {
    if (index < 0 || index >= _azkarList.length) return 0;
    return _azkarList[index].count - _currentCounts[index];
  }

  void handleError(String message) {
    emit(ZekrError(message: message));
  }
}
