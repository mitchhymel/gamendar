part of gamendar;


class AsyncConfirmationDialog extends StatefulWidget {

  final String confirmationText;
  final Future<String> Function() onPressedYes;
  final VoidCallback onPressedNo;
  final String progressText;

  AsyncConfirmationDialog({
    @required this.confirmationText,
    @required this.onPressedYes,
    this.onPressedNo,
    this.progressText='',
  });

  @override
  AsyncConfirmationDialogState createState() => new AsyncConfirmationDialogState();
}

class AsyncConfirmationDialogState extends State<AsyncConfirmationDialog> {

  bool isLoading = false;
  String resultMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onPressedYes(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    String result = await widget.onPressedYes();
    //Navigator.pop(context, true);

    setState(() {
      isLoading = false;
      resultMessage = result;
    });
  }

  List<Widget> _getActions(BuildContext context) {
    if (isLoading || resultMessage != null) {
      return [];
    }
    else if (resultMessage != null) {
      return [
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.pop(context, false);
          }
        )
      ];
    }
    else return <Widget>[
      FlatButton(
          child: Text('No'),
          onPressed: (){
            if (widget.onPressedNo != null) {
              widget.onPressedNo();
            }

            Navigator.pop(context, false);
          }
      ),
      FlatButton(
        child: Text('Yes'),
        onPressed: () async => await onPressedYes(context),
      ),
    ];
  }

  Widget _getContent(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(),
          Container(height: 10.0,),
          Text(widget.progressText),
        ],
      );
    }
    else if (resultMessage != null) {
      return Text(resultMessage);
    }
    else {
      return Text(widget.confirmationText);
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: _getContent(context),
    actions: _getActions(context),
  );
}