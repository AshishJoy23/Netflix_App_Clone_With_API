import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_app_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_app_clone/domain/hot_and_new/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(
        const HotAndNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: true,
            isError: false,
          )
      );
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results!,
            everyOneWatchingList: state.everyOneWatchingList,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });

    //get hot and new tv data
    on<LoadDataInEveryOneWatching>((event, emit) async{
      emit(
        const HotAndNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: true,
            isError: false,
          )
      );
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();
      //data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneWatchingList: resp.results!,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
