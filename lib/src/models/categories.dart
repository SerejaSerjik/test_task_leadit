enum Categories { arts, home, science, us, world }

extension ParseToString on Categories {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
