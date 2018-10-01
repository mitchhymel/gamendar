part of gamendar;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScopedModel<AppModel>(
        model: AppModel(),
        child: AppWidget()
    );
  }
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Gamendar',
    theme: AppModel.of(context).theme.getThemeData(),
    home: MainContainer(),
  );
}