// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$templatesHash() => r'00ac495774c367da3b63e29b2ef711a32dc49167';

/// See also [Templates].
@ProviderFor(Templates)
final templatesProvider =
    AsyncNotifierProvider<Templates, IList<TemplateEntity>>.internal(
  Templates.new,
  name: r'templatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$templatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Templates = AsyncNotifier<IList<TemplateEntity>>;
String _$templateStateHash() => r'7fee7e21133c1ae50fbb2900099626c742d876c2';

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

abstract class _$TemplateState
    extends BuildlessAsyncNotifier<Option<TemplateEntity>> {
  late final UniqueId id;

  Future<Option<TemplateEntity>> build({
    required UniqueId id,
  });
}

/// See also [TemplateState].
@ProviderFor(TemplateState)
const templateStateProvider = TemplateStateFamily();

/// See also [TemplateState].
class TemplateStateFamily extends Family<AsyncValue<Option<TemplateEntity>>> {
  /// See also [TemplateState].
  const TemplateStateFamily();

  /// See also [TemplateState].
  TemplateStateProvider call({
    required UniqueId id,
  }) {
    return TemplateStateProvider(
      id: id,
    );
  }

  @override
  TemplateStateProvider getProviderOverride(
    covariant TemplateStateProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'templateStateProvider';
}

/// See also [TemplateState].
class TemplateStateProvider
    extends AsyncNotifierProviderImpl<TemplateState, Option<TemplateEntity>> {
  /// See also [TemplateState].
  TemplateStateProvider({
    required this.id,
  }) : super.internal(
          () => TemplateState()..id = id,
          from: templateStateProvider,
          name: r'templateStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$templateStateHash,
          dependencies: TemplateStateFamily._dependencies,
          allTransitiveDependencies:
              TemplateStateFamily._allTransitiveDependencies,
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
  Future<Option<TemplateEntity>> runNotifierBuild(
    covariant TemplateState notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
