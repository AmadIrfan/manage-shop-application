import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/utils/custom_text_field.dart';
import '../res/alerts.dart';
import '../res/button.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final _formKey = GlobalKey<FormState>();

  Product _product = Product(
    quantity: 0,
    category: '',
    price: 0.0,
    name: '',
    img: '',
    description: '',
  );
  bool isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _priceController =
      TextEditingController(text: 0.0.toString());
  final TextEditingController _quantityController =
      TextEditingController(text: 0.toString());
  final TextEditingController _totalPriceController =
      TextEditingController(text: 0.0.toString());
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _priceFocus = FocusNode();
  final FocusNode _quantityFocus = FocusNode();
  final FocusNode _totalPriceFocus = FocusNode();
  final FocusNode _aboutFocus = FocusNode();
  final FocusNode _btnFocus = FocusNode();

  @override
  void initState() {
    _priceFocus.addListener(() {
      if (_priceFocus.hasFocus) {
        _priceController.text = '';
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _totalPriceController.dispose();
    _quantityController.dispose();
    _nameFocus.dispose();
    _priceFocus.dispose();
    _quantityFocus.dispose();
    _totalPriceFocus.dispose();
    _aboutFocus.dispose();
    _btnFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Items'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      alignment: Alignment.center,
                      child: const Text('Pick Image'),
                    ),
                    AppTextField(
                      nextFocus: _quantityFocus,
                      controller: _nameController,
                      label: 'Item Name',
                      validator: (va) {
                        if (va!.isEmpty) {
                          return 'Name of item is not be Empty';
                        } else {
                          return null;
                        }
                      },
                      onSubmit: (v) {
                        FocusScope.of(context).requestFocus(_quantityFocus);
                      },
                      onSave: (e) {
                        _product = Product(
                          quantity: _product.quantity,
                          category: _product.category,
                          price: _product.price,
                          name: e!,
                          img: _product.img,
                          description: _product.description,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: _quantityController,
                            textInputAction: TextInputAction.next,
                            focusNode: _quantityFocus,
                            nextFocus: _priceFocus,
                            keyboardType: TextInputType.number,
                            label: 'Quantity',
                            suffix: const Text('Item'),
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'Quantity field must have value ';
                              } else if (e == '0') {
                                return 'Quantity must be greater then 0 ';
                              } else {
                                return null;
                              }
                            },
                            onSave: (e) {
                              _product = Product(
                                quantity: int.parse(e!),
                                category: _product.category,
                                price: _product.price,
                                name: _product.name,
                                img: _product.img,
                                description: _product.description,
                              );
                            },
                            onChanged: (v) {
                              try {
                                _totalPriceController.text = (
                                  double.parse(
                                        _quantityController.text.isEmpty
                                            ? '0'
                                            : _quantityController.text,
                                      ) *
                                      double.parse(
                                        _priceController.text.isEmpty
                                            ? '0'
                                            : _priceController.text,
                                      ),
                                ).toString();
                              } catch (e) {
                                Alerts().showSnackBar(
                                  e.toString(),
                                  backgroundColor: Colors.red,
                                );
                              }
                            },
                            onSubmit: (v) {
                              FocusScope.of(context).requestFocus(_priceFocus);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: AppTextField(
                            nextFocus: _aboutFocus,
                            focusNode: _priceFocus,
                            controller: _priceController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            label: 'Price Per Item',
                            suffix: const Text('-/ PKR'),
                            validator: (e) {
                              if (e!.isEmpty) {
                                return 'Price field must have value ';
                              } else if (e == '0.0') {
                                return 'Price must be greater then 0 ';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (v) {
                              try {
                                _totalPriceController.text = (
                                  double.parse(
                                        _quantityController.text.isEmpty
                                            ? '0'
                                            : _quantityController.text,
                                      ) *
                                      double.parse(
                                        _priceController.text.isEmpty
                                            ? '0'
                                            : _priceController.text,
                                      ),
                                ).toString();
                              } catch (e) {
                                Alerts().showSnackBar(
                                  e.toString(),
                                  backgroundColor: Colors.red,
                                );
                              }
                            },
                            onSave: (e) {
                              _product = Product(
                                quantity: _product.quantity,
                                category: _product.category,
                                price: double.parse(e!),
                                name: _product.name,
                                img: _product.img,
                                description: _product.description,
                              );
                            },
                            onSubmit: (v) {
                              FocusScope.of(context).requestFocus(_aboutFocus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      focusNode: _totalPriceFocus,
                      controller: _totalPriceController,
                      keyboardType: TextInputType.number,
                      enabled: false,
                      readOnly: true,
                      textInputAction: TextInputAction.next,
                      label: 'Total Price',
                      suffix: const Text('-/PKR'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      focusNode: _aboutFocus,
                      nextFocus: _btnFocus,
                      onSubmit: (e) {
                        FocusScope.of(context).requestFocus(_btnFocus);
                      },
                      onSave: (e) {
                        _product = Product(
                          quantity: _product.quantity,
                          category: _product.category,
                          price: _product.price,
                          name: _product.name,
                          img: _product.img,
                          description: e,
                        );
                      },
                      controller: _aboutController,
                      maxLines: 5,
                      label: 'About',
                    ),
                  ],
                ),
              ),
            ),
          ),
          PressButton(
            isLoading: isLoading,
            focusNode: _btnFocus,
            title: 'Save',
            bgColor: Theme.of(context).colorScheme.primary,
            onTap: () {
              setState(() {
                isLoading = true;
              });
              //       if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              print(_product.toString());
              Lottie.asset('Assets/lottie/lottie_done.json');
              //       }
              setState(() {
                // isLoading = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
