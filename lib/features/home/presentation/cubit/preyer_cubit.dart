import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sadaqa_app/core/services/location_service.dart';
import 'package:sadaqa_app/features/home/domin/repos/prayer_repo.dart';

import '../../domin/entites/preyer_entity.dart';

part 'preyer_state.dart';

class PreyerCubit extends Cubit<PreyerState> {
  PreyerCubit(this.prayerRepo) : super(PreyerInitial());
  List<PreyerEntity> prayers = [];
  PreyerEntity? nextPrayer;
  final PrayerRepo prayerRepo;
  String placeUser = '';
  getPrayerTimes() async {
    emit(PreyerLoading());
    final location = await prayerRepo.getCurrunetLocation();
    location.fold((failure) => emit(PreyerFailure(failure.errorMessage)), (
      location,
    ) async {
      getPlacemarksFromCoordinates(getUserLocation: location);
      final result = await prayerRepo.getPrayerTimes(location: location);
      result.fold((failure) => emit(PreyerFailure(failure.errorMessage)), (
        prayerTimes,
      ) {
        prayers = prayerTimes;
        log('${prayerTimes[0].prayerTime}');
        nextPrayer = getNextPrayer();
        emit(PreyerSuccess(prayerTimes: prayerTimes));
      });
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

  getCurrentLocation() async {
    final result = await prayerRepo.getCurrunetLocation();
    result.fold(
      (failure) => log('Failed to get location: ${failure.errorMessage}'),
      (location) {
        log('Current location: ${location.latitude}, ${location.longitude}');
      },
    );
  }

  getPlacemarksFromCoordinates({required UserLocation getUserLocation}) async {
    try {
      final placemarks = await prayerRepo.getPlacemarksFromCoordinates(
        userLocation: getUserLocation,
      );
      placeUser = '${placemarks.first.locality},${placemarks.first.country}';
      log('Placemarks: ${placemarks.map((p) => p.toString()).join(', ')}');
    } catch (e) {
      log('Failed to get placemarks: $e');
    }
  }
}
