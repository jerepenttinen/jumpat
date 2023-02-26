import 'package:fpdart/fpdart.dart';

abstract class IEntityConverter<Domain, Infra> {
  Domain toDomain(Infra infra);
  Infra toInfra(Domain domain);
}

Option<Domain> makeDomainOptionFromNullable<Domain, Infra>(
  Infra? infra,
  IEntityConverter<Domain, Infra> converter,
) {
  if (infra == null) {
    return none();
  }

  return some(converter.toDomain(infra));
}
