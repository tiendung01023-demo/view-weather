import 'package:equatable/equatable.dart';
import 'package:flutterapp/models/place_model.dart';

class SearchState extends Equatable {
  const SearchState({
    this.isError = false,
    this.isLoading = false,
    this.data = const [],
    this.textSearch = '',
  });

  final bool isError;
  final bool isLoading;
  final List<PlaceModel> data;
  final String textSearch;

  SearchState copyWith({
    bool? isError,
    bool? isLoading,
    List<PlaceModel>? data,
    String? textSearch,
  }) {
    return SearchState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      textSearch: textSearch ?? this.textSearch,
    );
  }

  @override
  List<Object?> get props => [
        isError,
        isLoading,
        data,
        textSearch,
      ];
}
