// perform validation within type instead of in presentation layer
class EmailAddress {
  const EmailAddress(
    this.value,
  ) : assert(value != null);

  final String value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EmailAddress && o.value == value;
  }

  @override
  String toString() => 'EmailAddress(value: $value)';
}
