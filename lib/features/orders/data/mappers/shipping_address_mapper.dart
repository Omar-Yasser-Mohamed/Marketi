import 'package:marketi/features/orders/data/models/shipping_address_model.dart';
import 'package:marketi/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressMapper {
  static ShippingAddressEntity mapToEntity(ShippingAddressModel model) {
    return ShippingAddressEntity(
      phone: model.phone ?? "",
      city: model.city ?? "",
      details: model.details ?? "",
    );
  }
}
