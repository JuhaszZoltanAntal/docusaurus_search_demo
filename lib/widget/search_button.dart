import 'package:docusaurus_search_demo/widget/search_dialog.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  SearchButtonState createState() => SearchButtonState();
}

class SearchButtonState extends State<SearchButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 40, top: 12, bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xff1b1b1d),
          borderRadius: BorderRadius.circular(20),
          border: isHover
              ? Border.all(width: 1.5, color: const Color(0xff21b091))
              : null,
        ),
        child: InkWell(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 5, bottom: 1),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                  child: Text(
                    "Search",
                    style: TextStyle(
                        color: isHover ? Colors.white : Colors.white70,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                  context: context, builder: (context) => const SearchDialog());
            },
            onHover: (val) {
              setState(() {
                isHover = val;
              });
            }),
      ),
    );
  }
}
