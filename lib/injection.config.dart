// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;
import 'package:jumpat/state/workouts_actor/workouts_actor_bloc.dart' as _i3;
import 'package:jumpat/state/workouts_watcher/workouts_watcher_bloc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.WorkoutsActorBloc>(
        () => _i3.WorkoutsActorBloc(isar: gh<_i4.Isar>()));
    gh.factory<_i5.WorkoutsWatcherBloc>(
        () => _i5.WorkoutsWatcherBloc(isar: gh<_i4.Isar>()));
    return this;
  }
}
