import 'package:etl_ai/repo/gemini_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _key = GlobalKey<FormState>();
  late TextEditingController _searchController;
  final List<String> _data = [];

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(geminiStateNotifierProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_data.isEmpty)
              const Expanded(child: Text('Type a search term and press send')),
            if (_data.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_data[index]),
                      ),
                    );
                  },
                ),
              )
            // text field widget with a send button on the right

            ,
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _key,
                    child: TextFormField(
                      controller: _searchController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter a search term',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a search term';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: state.isLoading
                      ? null
                      : () async {
                          if (!_key.currentState!.validate()) {
                            return;
                          }
                          final res = await ref
                              .read(geminiStateNotifierProvider.notifier)
                              .generateText(_searchController.text);
                          setState(() {
                            _data.add(res);
                          });
                        },
                  icon: state.isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
