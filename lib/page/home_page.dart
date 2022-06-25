import 'package:docusaurus_search_demo/widget/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/search_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LogicalKeyboardKey> keys = [];
  late bool alreadyOpened = false;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        final key = event.logicalKey;
        if (event is RawKeyDownEvent) {
          if (keys.contains(key)) return;
          setState(() => keys.add(key));
          if (keys.contains(LogicalKeyboardKey.keyK) &&
                  keys.contains(LogicalKeyboardKey.controlLeft) ||
              keys.contains(LogicalKeyboardKey.keyK) &&
                  keys.contains(LogicalKeyboardKey.controlRight)) {
            if (!alreadyOpened) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const SearchDialog();
                  });
              setState(() {
                alreadyOpened = true;
              });
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              setState(() {
                alreadyOpened = false;
              });
            }
          }
        } else {
          setState(() => keys.remove(key));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          actions: const [
            SearchButton(),
          ],
        ),
        body: Container(
          color: const Color(0xff2b3137),
        ),
      ),
    );
  }
}
