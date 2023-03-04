abstract class IConverter<Domain, Model> {
  Domain toDomain(Model model);
  Model toModel(Domain domain);
}
