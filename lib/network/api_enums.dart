enum CreateAccountsType { normal, easy, current }

extension Value on CreateAccountsType {
  int get value {
    switch (this) {
      case CreateAccountsType.normal:
        return 1;
      case CreateAccountsType.easy:
        return 2;
      case CreateAccountsType.current:
        return 3;
    }
  }
}
