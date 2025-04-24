sealed class RecipeInfoEvent {
  const factory RecipeInfoEvent.dialog(String message) = ShowDialog;
  const factory RecipeInfoEvent.rateDialog() = ShowRateDialog;
}

class ShowDialog implements RecipeInfoEvent {
  final String message;

  const ShowDialog(this.message);
}

class ShowRateDialog implements RecipeInfoEvent {
  const ShowRateDialog();
}
