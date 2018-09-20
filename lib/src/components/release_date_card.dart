part of gamendar;

class ReleaseDateCard extends StatelessWidget {
  final ReleaseDate date;
  ReleaseDateCard(this.date);

  @override
  Widget build(BuildContext context) => Card(
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
    )
  );
}