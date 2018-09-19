part of gamendar;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModel<AppModel>(
      model: AppModel(),
      child: AppWidget()
  );
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Gamendar',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainContainer(),
  );
}