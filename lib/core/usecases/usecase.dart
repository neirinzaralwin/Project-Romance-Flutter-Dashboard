abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  Future<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  Future<Type> call();
}
