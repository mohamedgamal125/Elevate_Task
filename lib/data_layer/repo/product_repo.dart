
import 'package:elevate_task/data_layer/api_manager/api_manager.dart';
import 'package:elevate_task/data_layer/models/product_model.dart';

class ProductRepo {

  final ApiManager apiManager;
  ProductRepo({required this.apiManager});
  Future<List<ProductModel>> getAllProducts()async{
    final products= await apiManager.getAllProducts();
    print("=============Data From Repo================");
    print(products);
    return products.map((product)=>ProductModel.fromJson(product)).toList();

  }
}