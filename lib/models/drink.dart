class Drink {
  String? thName;
  int? price;
  bool? checked;

  //constructor
  Drink(this.thName, this.price, this.checked);



  static getDrink() {
    return [
      Drink('คาปูชิโน่', 50, true),
      Drink('แบล็กออเรนจ์', 69, false),
      Drink('ชานมไข่มุก', 25, false),
      Drink('ชาเขียว',  285, false),
     
    ];
  }
}
