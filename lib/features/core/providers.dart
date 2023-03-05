import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase(openConnection());
});
