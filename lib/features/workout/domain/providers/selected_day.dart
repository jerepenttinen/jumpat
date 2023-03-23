import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_day.g.dart';

@Riverpod(keepAlive: true)
class SelectedDay extends _$SelectedDay {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void update(DateTime newDate) {
    state = newDate;
  }
}
