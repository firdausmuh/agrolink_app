import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String hintText;
  final bool readOnly;

  const SearchBar({
    Key? key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.hintText = 'Cari sayur disini',
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 24,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

// Optional: Separate component for handling search functionality
class SearchBarWithController extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;

  const SearchBarWithController({
    Key? key,
    required this.onSearch,
    this.hintText = 'Cari sayur disini',
  }) : super(key: key);

  @override
  State<SearchBarWithController> createState() =>
      _SearchBarWithControllerState();
}

class _SearchBarWithControllerState extends State<SearchBarWithController> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      hintText: widget.hintText,
      onChanged: widget.onSearch,
    );
  }
}
