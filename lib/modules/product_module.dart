class Products {
  String productname;
  String productname2;
  String productnameimage;
  double price;
  double? promoprice;
  int quantity;
  final String id;

  Products({
    required this.productname,
    required this.productname2,
    required this.productnameimage,
    required this.price,
    this.promoprice,
    required this.quantity,
    required this.id,
  });
}
