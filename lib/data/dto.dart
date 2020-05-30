
import 'package:dataclass/dataclass.dart';

@dataClass
class Request {
  final List<ProductUnit> product;
  final String owner;
  final String notes;
  final String date;
  final String status;
  final String volunteer;

  Request(
      this.product,
      this.owner,
      this.notes,
      this.date,
      this.status,
      this.volunteer
      );
}

@dataClass
class ProductUnit {
  final String product;
  final String productCount;

  ProductUnit(this.product, this.productCount);
}
