import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';
import 'package:tsid_creator/tsid_creator.dart';

final _factory = TsidFactory();

class UniqueId extends ValueObject<int> {
  factory UniqueId() {
    return UniqueId._(
      right(_factory.generate().toInt()),
    );
  }

  const UniqueId._(this.value);

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueInt(int uniqueIdInt) {
    return UniqueId._(
      right(uniqueIdInt),
    );
  }

  @override
  final Either<ValueFailure<int>, int> value;
}
