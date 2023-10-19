/// The code defines an enum called `Routes` in Dart. An enum is a special data type that represents a group of related
/// constants.
enum Routes {
  root(
    path: '/',
    name: 'splashPage',
  ),
  login(
    path: '/login',
    name: 'loginPage',
  ),

  countries(
    path: '/countries',
    name: 'countriesPage',
  ),
  competitions(
    path: '/competitions',
    name: 'competitionsPage',
  ),
  notAvailable(
    path: '/notAvailable',
    name: 'notAvailablePage',
  ),
  notAvailable1(
    path: '/notAvailable1',
    name: 'notAvailablePage1',
  ),
  mainMenu(
    path: '/mainMenu',
    name: 'mainMenuPage',
    children: [competitions, notAvailable, notAvailable1],
  );

  const Routes({required this.path, required this.name, this.children});

  final String path;
  final String name;
  final List<Routes>? children;
}
