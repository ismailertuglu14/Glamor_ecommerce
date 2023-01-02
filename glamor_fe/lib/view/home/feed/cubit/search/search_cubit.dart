import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/view/home/feed/cubit/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(isLoading: true));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      // TODO your code here

      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }

  void changeIsClicked(bool isClicked) => emit(state.copyWith(isClicked: true));
}
