import 'package:docusaurus_search_demo/widget/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/search_dialog.dart';

class OpenDialogIntent extends Intent {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LogicalKeyboardKey> keys = [];

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyK):
            OpenDialogIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          OpenDialogIntent:
              CallbackAction<OpenDialogIntent>(onInvoke: (intent) {
            showDialog(
                context: context,
                builder: (context) {
                  return const SearchDialog();
                });
            return null;
          }),
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            actions: const [
              SearchButton(),
            ],
          ),
          body: Focus(
            autofocus: true,
            child: Container(
              color: const Color(0xff2b3137),
            ),
          ),
        ),
      ),
    );
  }
}
