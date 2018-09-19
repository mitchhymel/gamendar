part of gamendar;

class ReleaseDateCard extends StatelessWidget {
  final ReleaseDate date;
  ReleaseDateCard(this.date);

  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      children: <Widget>[
        Image.network(
          date.gameExpanded.cover.getImageUrl(IGDBImageSizes.HD720P, isRetina: true),
          height: 100.0,
          width: 100.0
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