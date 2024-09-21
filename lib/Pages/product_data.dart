class Product {
  final String product;
  final String category;
  final String status;
  final String alternative;

  Product(this.product, this.category, this.status, this.alternative);
}

class ProductData {
  static List<Product> getProducts() {
    return [
      Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Sauces, Syrupl', 'Knorr', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, BarkaNational, Youngs, Mehran, Dipitt, Bake Parlor, Sundip, Salman’s'),
      Product('Sauces, Syrup', 'Hershey’s ', 'Boycotted', 'National, Youngs, Mehran, Dipitt, Bake Parlor, Sundip, Salman’s'),
        Product(' Spices ', 'Knorr', 'Boycotted', 'National, Shan, Mehran'),
      Product('Baking Items', ' Rafhan', 'Boycotted', 'Rossmorr, Mother Choice'),
        Product('Desserts', ' Rafhan', 'Boycotted', 'National, Happy Home, Fauji, Bake parlor, Kolson, Laziza, Mehran'),
      Product('Tea,Cofee', 'Lipton', 'Boycotted', 'Tapal, Vital, Islamabad Tea, Imtiaz Coffee'),
        Product('Tea,Cofee', 'Nescafe', 'Boycotted', 'Tapal, Vital, Islamabad Tea, Imtiaz Coffee'),
      Product('Spreads, Pickle', 'Nutella', 'Boycotted', 'Nature’s Home Butter'),
        Product('Jam/Jelly', 'Rafhan', 'Boycotted', 'National, salman’s, Kissan, Mitchells, Choco Bliss'),
      Product('Cereals', 'Kellogg’s', 'Boycotted', 'Fauji,Mico, Nature’s Home'),
        Product('Cereals', 'Nestle', 'Boycotted', 'Fauji,Mico, Nature’s Home'),
      Product('Cereals', 'Weetabix', 'Boycotted', 'Fauji,Mico, Nature’s Home'),

        Product('Pasta', 'Knorr', 'Boycotted', 'Bake palor, Kolson, Crispo'),
      Product('Pasta', 'Ragu', 'Boycotted', 'Bake palor, Kolson, Crispo'),
        Product('Noodles', 'Maggi', 'Boycotted', 'Shan'),
      Product('Noodles', 'Knorr', 'Boycotted', 'Shan'),
        Product('Noodles', 'Blazin', 'Boycotted', 'Shan'),
      Product('Cerelac', 'Nestle ', 'Boycotted', 'Searle,Cow & Gate'),

        Product('Fruit cans', 'Italia', 'Boycotted', 'Melapine,Polac'),
      Product('Fruit cans', 'Del Monte', 'Boycotted', 'Melapine,Polac'),
      Product('Bread, Ruskl', 'Britannia', 'Boycotted', 'Dawn, Bhashani, Bake palor, Hilal'),

        Product('Bread,Rusk', 'Modern', 'Boycotted', 'Dawn, Bhashani, Bake palor, Hilal'),
      Product('Cheese', 'happy Cow', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),
        Product('Cheese', 'President', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),

          Product('Cheese', ' Arla', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),
      Product('Cheese', 'castello', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),
        Product('Cheese', 'KDD', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),
      Product('Cheese', 'Trestelie', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),


        Product('Cheese', 'Philadelphia', 'Boycotted', 'Pure, Khadam, Neeli bar, Nurpur, Peak Fresh, Day fresh'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),

        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
        Product('Cooking Oil', 'Dalda', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),
      Product('Cooking Oil', 'Rafhan', 'Boycotted', 'Sufi, Kisan, Meezan, Andaaz, Habib, Soya Supreme, Barkat'),


     
    ];
  }
}

