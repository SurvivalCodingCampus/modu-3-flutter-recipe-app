sealed class SplashEvent {
  const factory SplashEvent.dialog(String message) = ShowDialog;

  const factory SplashEvent.snackbar(String message) = ShowSnackbar;
}

class ShowDialog implements SplashEvent {
  final String message;

  const ShowDialog(this.message);
}

class ShowSnackbar implements SplashEvent {
  final String message;

  const ShowSnackbar(this.message);
}
