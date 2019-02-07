part of gamendar;

class ConfirmationDialog extends StatelessWidget {

  final String confirmationText;
  final VoidCallback onPressedYes;
  final VoidCallback onPressedNo;

  ConfirmationDialog({
    @required this.confirmationText,
    @required this.onPressedYes,
    this.onPressedNo
  });

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: new Text(confirmationText),
      actions: <Widget>[
        new FlatButton(
            child: new Text('No'),
            onPressed: (){
              if (onPressedNo != null) {
                onPressedNo();
              }

              Navigator.pop(context, false);
            }
        ),
        new FlatButton(
          child: new Text('Yes'),
          onPressed: () {
            onPressedYes();
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}