import 'package:flutter/material.dart';
import 'package:github_repository_search/src/export_box.dart';

final searchRepositoryControllerProvider =
    StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final textControllerRepository = StateNotifierProvider.autoDispose<
    TextControllerRepository, TextEditingController>(
  (ref) => TextControllerRepository(ref),
);

class TextControllerRepository extends StateNotifier<TextEditingController> {
  final Ref ref;
  TextControllerRepository(this.ref)
      : super(ref.watch(searchRepositoryControllerProvider));

  TextEditingController takeController() {
    return state;
  }

  void onChange(String text) {
    state.value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(
        TextPosition(offset: text.length),
      ),
    );
  }
}
