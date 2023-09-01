import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){},
            child: Text("Dar en Adopcion"),
          ),
          Container(
            height: height *0.73,
            child: CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
