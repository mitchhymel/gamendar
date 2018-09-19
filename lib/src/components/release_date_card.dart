part of gamendar;

class ReleaseDateCard extends StatelessWidget {
  final ReleaseDate date;
  ReleaseDateCard(this.date);

  @override
  Widget build(BuildContext context) => Text(date.gameExpanded.name);
}