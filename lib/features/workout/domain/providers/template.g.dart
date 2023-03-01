// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$TemplatesHash() => r'ed28c72430e178f19b6aacf76f4be961bbf6a997';

/// See also [Templates].
final templatesProvider =
    AsyncNotifierProvider<Templates, IList<TemplateEntity>>(
  Templates.new,
  name: r'templatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$TemplatesHash,
);
typedef TemplatesRef = AsyncNotifierProviderRef<IList<TemplateEntity>>;

abstract class _$Templates extends AsyncNotifier<IList<TemplateEntity>> {
  @override
  FutureOr<IList<TemplateEntity>> build();
}

String _$TemplateStateHash() => r'3d8e86011cb9170741c5f39b91aaeafc601ce8fb';

/// See also [TemplateState].
class TemplateStateProvider
    extends AsyncNotifierProviderImpl<TemplateState, TemplateEntity> {
  TemplateStateProvider({
    required this.id,
  }) : super(
          () => TemplateState()..id = id,
          from: templateStateProvider,
          name: r'templateStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$TemplateStateHash,
        );

  final UniqueId id;

  @override
  bool operator ==(Object other) {
    return other is TemplateStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<TemplateEntity> runNotifierBuild(
    covariant _$TemplateState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}

typedef TemplateStateRef = AsyncNotifierProviderRef<TemplateEntity>;

/// See also [TemplateState].
final templateStateProvider = TemplateStateFamily();

class TemplateStateFamily extends Family<AsyncValue<TemplateEntity>> {
  TemplateStateFamily();

  TemplateStateProvider call({
    required UniqueId id,
  }) {
    return TemplateStateProvider(
      id: id,
    );
  }

  @override
  AsyncNotifierProviderImpl<TemplateState, TemplateEntity> getProviderOverride(
    covariant TemplateStateProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'templateStateProvider';
}

abstract class _$TemplateState extends BuildlessAsyncNotifier<TemplateEntity> {
  late final UniqueId id;

  FutureOr<TemplateEntity> build({
    required UniqueId id,
  });
}
