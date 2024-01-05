abstract class AllProductEvent {
  const AllProductEvent();
}

class GetAllProductsEvent extends AllProductEvent {
  const GetAllProductsEvent();
}

class GetProductDetailEvent extends AllProductEvent {
  const GetProductDetailEvent();
}
