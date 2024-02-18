import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _discriotionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNote = FocusNode();

  @override
  void initState() {
    _imageUrlFocusNote.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNote.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _discriotionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNote.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNote.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'type title',
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(25.0),
                  //   borderSide: BorderSide(
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  // ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Add Price',
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(25.0),
                  //   borderSide: BorderSide(
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  // ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_discriotionFocusNode);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Discription'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _discriotionFocusNode,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(top: 8, right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text('Enter a URL')
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              _imageUrlController.text,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNote,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
