import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class UniqueId extends ValueObject<String> {
  factory UniqueId() {
    return UniqueId._(
      right(_uuid.v4()),
    );
  }

  const UniqueId._(this.value);

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(
      right(uniqueIdStr),
    );
  }

  @override
  final Either<ValueFailure<String>, String> value;
}
