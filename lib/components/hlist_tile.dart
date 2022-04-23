import 'package:flutter/material.dart';

class HListTile extends StatefulWidget {
  late String text;
  HListTile({required this.text, Key? key}) : super(key: key);

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
      onTap: (){},
      child: SizedBox(width: _width/3,height: 10,
        child: ListTile(
            tileColor: Colors.grey[800],
            title: Text(
              widget.text,
              style: TextStyle(
                color: color,
              ),
            ),),
      ),
    );
  }
}
