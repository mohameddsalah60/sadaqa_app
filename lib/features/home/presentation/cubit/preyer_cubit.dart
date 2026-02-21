import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sadaqa_app/features/home/domin/repos/prayer_repo.dart';

import '../../domin/entites/preyer_entity.dart';

part 'preyer_state.dart';

class PreyerCubit extends Cubit<PreyerState> {
  PreyerCubit(this.prayerRepo) : super(PreyerInitial());
  List<PreyerEntity> prayers = [];
  PreyerEntity? nextPrayer;
  final PrayerRepo prayerRepo;
  getPrayerTimes() async {
    emit(PreyerLoading());
    final result = await prayerRepo.getPrayerTimes();
    result.fold((failure) => emit(PreyerFailure(failure.errorMessage)), (
      prayerTimes,
    ) {
      prayers = prayerTimes;
      log('${prayerTimes[0].prayerTime}');
      nextPrayer = getNextPrayer();
      emit(PreyerSuccess(prayerTimes: prayerTimes));
    });
  }

  PreyerEntity getNextPrayer() {
    final now = DateTime.now();

    prayers.sort((a, b) => a.prayerTime.compareTo(b.prayerTime));

    for (var prayer in prayers) {
      if (prayer.prayerTime.isAfter(now)) {
        log('Next prayer: ${prayer.prayerName}');
        return prayer;
      }
    }

    final fajrTomorrow = PreyerEntity(
      prayerName: prayers.first.prayerName,
      prayerTime: prayers.first.prayerTime.add(const Duration(days: 1)),
    );

    log('Next prayer: ${fajrTomorrow.prayerName} tomorrow');

    return fajrTomorrow;
  }

  void updateNextPrayer() {
    nextPrayer = getNextPrayer();

    emit(PreyerSuccess(prayerTimes: prayers));
  }
}
