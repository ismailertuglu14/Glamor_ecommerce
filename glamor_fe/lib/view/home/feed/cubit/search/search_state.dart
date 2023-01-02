class SearchState {
  final bool isLoading;
  final String? error;
  bool isClicked;
  SearchState({
    this.isLoading = false,
    this.error,
    this.isClicked = false,
  });

  SearchState copyWith({bool? isLoading, String? error, bool? isClicked}) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isClicked: isClicked ?? this.isClicked,
    );
  }
}
