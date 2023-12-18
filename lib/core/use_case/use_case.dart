//returns a Type(T)

abstract class UseCase<T> {
  Future<T> call();
}
