import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class TemplateColor extends ValueObject<Color> {
  factory TemplateColor(Color color) {
    return TemplateColor._(Right(color));
  }
  const TemplateColor._(this.value);

  @override
  final Either<ValueFailure<Color>, Color> value;
}
