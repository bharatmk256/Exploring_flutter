import 'package:flutter/material.dart';
import 'package:nottodo_app/model/nodo_item.dart';
import 'package:nottodo_app/util/database_client.dart';
import 'package:nottodo_app/util/date_formatter.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = new DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  @override
  void initState() {
    super.initState();
    _readNoDoList();
  }

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    NoDoItem noDoItem = new NoDoItem(text, dateFormatted());
    int savedItemId = await db.saveItem(noDoItem);
    NoDoItem addedItem = await db.getItem(savedItemId);

    setState(() {
      _itemList.insert(0, addedItem);
    });

    print("Item Saved id: $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
//      const BouncingScrollPhysics({ ScrollPhysics parent }) : super(parent: parent);
              padding: new EdgeInsets.all(8.0),
              reverse: false,
              itemCount: _itemList.length,
              itemBuilder: (_, int index) {
                return Card(
                  color: Colors.white10,
                  child: new ListTile(
                    title: _itemList[index],
                    onLongPress: () => _updateItem(_itemList[index], index),
                    trailing: new Listener(
                      key: new Key(_itemList[index].itemName),
                      child: new Icon(
                        Icons.remove_circle,
                        color: Colors.redAccent,
                      ),
                      onPointerDown: (pointerEvent) =>
                          _deleteNoDo(_itemList[index].id, index),
                    ),
                  ),
                );
              },
            ),
          ),
          new Divider(
            height: 1.0,
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "Add Item",
        child: new ListTile(
          title: new Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.redAccent,
        onPressed: _showFormDialogue,
      ),
    );
  }

  void _showFormDialogue() {
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't drive car",
                icon: Icon(Icons.note_add),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _handleSubmitted(_textEditingController.text);
            _textEditingController.clear();
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        new FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (_) {
        return alert;
      },
    );
  }

  _readNoDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
//      NoDoItem noDoItem = NoDoItem.map(item);
      setState(
        () {
          _itemList.add(NoDoItem.map(item));
        },
      );
//      print("Db items: ${noDoItem.itemName}");
    });
  }

  _deleteNoDo(int id, int index) async {
    debugPrint("Deleted Item");
    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(NoDoItem item, int index) {
    var alert = new AlertDialog(
      title: new Text("Update Item"),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: new InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't watch movies",
                icon: new Icon(Icons.system_update),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () async {
            NoDoItem newItemUpdated = NoDoItem.fromMap(
              {
                "itemName": _textEditingController.text,
                "dateCreated": dateFormatted(),
                "id": item.id,
              },
            );
            _handleSubmittedUpdate(index, item);
            await db.updateItem(newItemUpdated);
            setState(() {
              _readNoDoList();
            });
            Navigator.pop(context);
          },
          child: new Text("Upadte"),
        ),
        new FlatButton(
          onPressed: () => Navigator.pop(context),
          child: new Text(
            "Cancel",
          ),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (_) {
        return alert;
      },
    );
  }

  void _handleSubmittedUpdate(int index, NoDoItem item) {
    setState(
      () {
        _itemList.removeWhere(
          (element) {
            _itemList[index].itemName == item.itemName;
          },
        );
      },
    );
  }
}
