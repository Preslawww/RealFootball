import 'dart:async';

enum NavBarItem { HOME, SOURCES, SEARCH, MATCHES, PROFILE, LEAGUES }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.SOURCES);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.SEARCH);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.MATCHES);
        break;
      case 4:
        _navBarController.sink.add(NavBarItem.PROFILE);
        break;
      case 5:
        _navBarController.sink.add(NavBarItem.LEAGUES);
    }
  }

  close() {
    _navBarController.close();
  }
}
