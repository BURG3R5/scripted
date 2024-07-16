extension ListUtils on List {
  bool endsWith(List other) {
    if (isEmpty || length < other.length) {
      return false;
    }

    for (int i = 0; i < other.length; i++) {
      if (this[length - other.length + i] != other[i]) {
        return false;
      }
    }

    return true;
  }
}
