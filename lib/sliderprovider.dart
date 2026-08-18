import 'package:flutter_riverpod/legacy.dart';

final SliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: 0.5, showpassword: false);
});

class AppState {
  final double slider;
  final bool showpassword;
  AppState({required this.slider, required this.showpassword});
  AppState copyWith({double? slider, bool? showpassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showpassword: showpassword ?? this.showpassword,
    );
  }
}
