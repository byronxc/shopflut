import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _shoppingList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[25],
      appBar: AppBar(
        title: const Text(
          'Shopflut',
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IndieFlower'),
        ),
        backgroundColor: Colors.orange,
      ),
      body: bodyContent(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add',
          child: const Icon(Icons.add),
          backgroundColor: Colors.orange),
    );
  }

  void _addItem(String title) {
    setState(() {
      _shoppingList.add(title);
    });
    _textFieldController.clear();
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add an item to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter an item here'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addItem(_textFieldController.text);
                },
              ),
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }).then((value) => value ?? false);
  }

  bodyContent() {
    return ListView.builder(
        itemCount: _shoppingList.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFFEFDFBB),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                _shoppingList[index],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.orange,
                ),
                onPressed: () {
                  SnackBar snackBar = SnackBar(
                    content: Text("${_shoppingList[index]} was removed"),
                    backgroundColor: Colors.orange,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {
                    _shoppingList.removeAt(index);
                  });
                },
              ),
            ),
          );
        });
  }
}
