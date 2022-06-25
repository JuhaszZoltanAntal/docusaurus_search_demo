import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final myController = TextEditingController();
  final keyboardFocusNode = FocusNode();
  final textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return RawKeyboardListener(
      autofocus: false,
      focusNode: keyboardFocusNode,
      onKey: (event) {
        if (mounted) {
          if (event is RawKeyDownEvent) {
            if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
              Navigator.of(context, rootNavigator: true).maybePop();
            }
          }
        }
      },
      child: currentWidth > 600
          ?
          //Desktop
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff242526),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                margin: const EdgeInsets.only(top: 80),
                width: 530,
                height: 190,
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Material(
                        color: const Color(0xff242526),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xff1b1b1d),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xff21b091),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Color(0xff21b091)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff21b091), width: 3),
                                  borderRadius: BorderRadius.circular(5.0)),
                              hintText: 'Search docs',
                              hintStyle:
                                  const TextStyle(color: Colors.white70)),
                          style: const TextStyle(color: Colors.white),
                          focusNode: textFieldFocusNode,
                          autofocus: true,
                          controller: myController,
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xff242526),
                      height: 80,
                      width: 530,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            "No recent searches",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff1b1b1d),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: 530,
                      ),
                    ),
                  ],
                ),
              ),
            )
          :
          //Mobile
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Material(
                      color: const Color(0xff242526),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xff1b1b1d),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xff21b091),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Color(0xff21b091)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff21b091), width: 2),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    hintText: 'Search docs',
                                    hintStyle:
                                        const TextStyle(color: Colors.white70)),
                                style: const TextStyle(color: Colors.white),
                                focusNode: textFieldFocusNode,
                                autofocus: true,
                                controller: myController,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: const Color(0xff21b091),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: const Color(0xff242526),
                        width: currentWidth,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              "No recent searches",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xff1b1b1d),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: currentWidth,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
