class ProductEntity {
  final String description;
  final String imageUrl;
  final String? discount;
  final String? price;
  final String afterDiscountPrice;

  ProductEntity(this.description, this.imageUrl, this.discount, this.price,
      this.afterDiscountPrice);
}
