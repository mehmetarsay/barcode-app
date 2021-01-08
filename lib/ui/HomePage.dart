import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewUrun.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _input = TextEditingController();
  GlobalKey<FormFieldState> _formkey;
  List<Text> _list = [];

  @override
  void initState() {
    super.initState();
    _formkey = new GlobalKey<FormFieldState>();
  }
  void _addToList(inputText) {
    setState(() {
      _list.add(inputText);
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Memmar Market',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewUrun()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      /*bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: FormField(
          key: _formkey,
          builder:(state){
            return TextFormField(
                controller: _input,
                decoration: InputDecoration(
                  labelText: "Barkod",
                  border: OutlineInputBorder(),
                ),
                //validator: _nameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null) {
                    return null;
                  } else {
                    debugPrint("hata var");
                    return "hata";
                  }
                });
          }

        ),
      ),*/
      /*Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 3,color: Colors.black),
          borderRadius: new BorderRadius.all(
              new Radius.circular(15.0),
          ),
          //color: Colors.white
        ),

      ),*/
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.lightBlueAccent,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(title: Text("List Item $index"));
              },
            ),
          ),
        ),
        Container(
          height: 65,
          color: Colors.tealAccent,
          child: TextFormField(
            maxLines: 1,
            controller: _input,
            decoration: new InputDecoration(
              hintText: "Text input",
              hintStyle: new TextStyle(color: Colors.black),
              border: new OutlineInputBorder(
                borderRadius:
                const BorderRadius.all(const Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    ),
    ),

    );
  }

  UrunFiyatlandir() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Text("1x"),
                Text(" ürün ismi"),
              ],
            ),
          ),
          Container(child: Text("3.75"))
        ],
      ),
    );
  }
}
