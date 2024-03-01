
import 'package:flutter/material.dart';

class LazyReloadDemo extends StatefulWidget {
  @override
  _LazyReloadDemoState createState() => _LazyReloadDemoState();
}

class _LazyReloadDemoState extends State<LazyReloadDemo> {
  List<int> items = List.generate(50, (index) => index); // Initial list of items
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Reached the end of the list, load more items
      _loadMoreItems();
    }
  }

  void _loadMoreItems() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      // Simulating a delay to fetch more items
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        items.addAll(List.generate(20, (index) => index + items.length));
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Reload Demo'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text('Item ${items[index]}'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
