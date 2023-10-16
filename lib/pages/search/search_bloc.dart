import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/pages/search/search_state.dart';
import 'package:flutterapp/repositories/place_repository.dart';

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(const SearchState());

  Timer? _debounce;
  final PlaceRepository _placeRepository = PlaceRepository();

  Future<void> getPlaces({required String search}) async {
    emit(state.copyWith(isLoading: true, isError: false, textSearch: search));
    try {
      _debounce?.cancel();
      
      if (search.isEmpty) {
        emit(state.copyWith(data: [], isLoading: false));
      } else {
        _debounce = Timer(
          const Duration(seconds: 2),
          () async {
            final result = await _placeRepository.getPlaces(search: search);
            if (!isClosed) emit(state.copyWith(data: result, isLoading: false));
          },
        );
      }
    } catch (e) {
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
