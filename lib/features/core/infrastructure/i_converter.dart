abstract class IConverter<T, K> {
  T toFirst(K second);
  K toSecond(T first);
}
