import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practice_project/models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController _productNameTEController;
  late TextEditingController _unitPriceTEController;
  late TextEditingController _totalPriceTEController;
  late TextEditingController _productImageTEController;
  late TextEditingController _productCodeTEController;
  late TextEditingController _productQuantityTEController;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  void initState() {
    _productNameTEController =
        TextEditingController(text: widget.product.productName);
    _productCodeTEController =
        TextEditingController(text: widget.product.productCode);
    _unitPriceTEController =
        TextEditingController(text: widget.product.unitPrice);
    _productQuantityTEController =
        TextEditingController(text: widget.product.quantity);
    _totalPriceTEController =
        TextEditingController(text: widget.product.totalPrice);
    _productImageTEController =
        TextEditingController(text: widget.product.productImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: _inProgress
                ? const Center(child: CircularProgressIndicator())
                : _buildProductForm()),
      ),
    );
  }

  Form _buildProductForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
              hintText: 'Name',
              labelText: 'Product Name',
            ),
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Unit Price',
            ),
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
          ),
          TextFormField(
            controller: _productImageTEController,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
          ),
          TextFormField(
            controller: _productQuantityTEController,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: updateProduct,
            child: const Text('Update Product'),
          ),
        ],
      ),
    );
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');
    Map<String, dynamic> body = {
      'Img': _productImageTEController.text,
      'ProductName': _productNameTEController.text,
      'ProductCode': _productCodeTEController.text,
      'UnitPrice': _unitPriceTEController.text,
      'Qty': _productQuantityTEController.text,
      'TotalPrice': _totalPriceTEController.text,
    };
    Response response = await post(uri, body: jsonEncode(body), headers: {
      'Content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Product Updated!'),
      ));
    } else {
      print('Failed to update product: ${response.body}');
    }
    _inProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
    _productCodeTEController.dispose();
    _productQuantityTEController.dispose();
    super.dispose();
  }
}
