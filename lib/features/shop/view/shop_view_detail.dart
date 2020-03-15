import 'package:flutter/material.dart';

class ShopDetailView extends StatelessWidget {
  final int index;

  const ShopDetailView({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Image$index");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "Image$index",
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                          "https://www.granoro.it/Contents/Images/20190110111627_42mezzigomiti_iclassici_cuscino.png")),
                ),
              ),
            ),
            Hero(
              tag: "Image$index-",
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
