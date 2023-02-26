import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_failure.freezed.dart';

@freezed
abstract class TemplateFailure with _$TemplateFailure {
  const factory TemplateFailure.unexpected() = Unexpected;
}
