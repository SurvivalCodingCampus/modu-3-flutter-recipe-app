sealed class SplashEvent {
  const factory SplashEvent.success(String message) = ShowDialog;

  const factory SplashEvent.error(String message) = ShowSnackbar;
}

class ShowDialog implements SplashEvent {
  final String data;

  const ShowDialog(this.data);
}

class ShowSnackbar implements SplashEvent {
  final String message;

  const ShowSnackbar(this.message);
}
