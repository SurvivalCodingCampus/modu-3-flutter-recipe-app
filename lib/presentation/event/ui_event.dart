sealed class UiEvent {}

class ShowSnackBar extends UiEvent {
  final String message;
  ShowSnackBar(this.message);
}
