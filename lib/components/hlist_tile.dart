import 'package:flutter/material.dart';

class HListTile extends StatefulWidget {
  late String text;
  void Function() callback;
  final int id;
  double size;
  HListTile(
      {required this.id,
      required this.text,
      required this.callback,
        required this.size,
      Key? key})
      : super(key: key);

  @override
  State<HListTile> createState() => _HListTileState();
}

class _HListTileState extends State<HListTile> {

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    double _width = _size.width;
    double _height = _size.height;
    Color color = Colors.grey;
    return GestureDetector(
      onTap: widget.callback,
      child: SizedBox(
        width: _width / 3,
        height: 10,
        child: ListTile(
          tileColor: Colors.grey[800],
          title: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.size,
             color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
