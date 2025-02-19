import 'package:flutter/material.dart';

class AddReviews extends StatefulWidget {
  final BuildContext ctx;
  final String id;
  const AddReviews({super.key, required this.ctx, required this.id});
  
  @override
  State<AddReviews> createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _reviewC = TextEditingController();
  String name = '';
  String review = '';

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Reviews'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    controller: _nameC,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Add Name"
                    ),
                  ),
                  TextField(
                    controller: _reviewC,
                    decoration: const InputDecoration(
                      labelText: "Review",
                      hintText: "Add Review",
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                child: Text(
                  'CANCEL',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white
                  )
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                child: Text(
                  'OK', 
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white
                  )
                ),
                onPressed: () {
                  debugPrint(_nameC.text);
                  debugPrint(_reviewC.text);
                  debugPrint("on progress");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () => _displayTextInputDialog(context),
          child: const ListTile(
            leading: Icon(Icons.add),
            title: Text('Add new review'),
          ),
        ),
      ),
    );
  }
}