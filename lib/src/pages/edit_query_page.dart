part of gamendar;


class EditQueryPage extends StatefulWidget {
  final Query query;
  EditQueryPage({this.query});

  @override
  State createState() => _EditQueryPageState();
}

class _EditQueryPageState extends State<EditQueryPage> {



  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(''),
      actions: <Widget>[
        IconButton(
          onPressed: () => print('save'),
          icon: Icon(Icons.save, color: Colors.white,),
        )
      ],
    ),
  );
}