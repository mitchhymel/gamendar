part of gamendar;

class ReleaseDateCard extends StatelessWidget {
  final ReleaseDate date;
  ReleaseDateCard(this.date);


  _onTap(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new DetailsPage(
            game: date.gameExpanded,
            source: 'homepage${date.id}',
          );
        }
    ));
  }

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: () => _onTap(context),
      child: Row(
        children: <Widget>[
          GameImage(
            game: date.gameExpanded,
            height: 100.0,
            width: 100.0,
            source: 'homepage${date.id}',
          ),
          Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(date.gameExpanded.name),
                ],
              )
          )
        ],
      ),
    )
  );
}