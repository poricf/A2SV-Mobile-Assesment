import 'package:flutter/material.dart';

Widget searchBar() {
  return Container(
    width: 345,
    height: 56,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      onChanged: (value) {
        // Perform search here using the value
        print('Searching for: $value');
      },
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon:  Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: Icon(Icons.tune_outlined),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16),
      ),
    ),
  );
}
