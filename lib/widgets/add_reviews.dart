import 'package:flutter/material.dart';

class AddReviews extends StatefulWidget {
  final BuildContext ctx;
  final String id;
  const AddReviews({Key? key, required this.ctx, required this.id}) : super(key: key);
  
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
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    controller: _nameC,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Add Name"
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        review = value;
                      });
                    },
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
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child:
                    const Text('CANCEL', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  setState(() {
                    print("Belum jadi :)");
                    Navigator.pop(context);
                  });
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