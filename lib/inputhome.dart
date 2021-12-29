import 'package:flutter/material.dart';
import 'package:inputwidgets/models/drink.dart';
import 'package:inputwidgets/models/food.dart';

class inputHomePage extends StatefulWidget {
  const inputHomePage({Key? key}) : super(key: key);

  @override
  _inputHomePageState createState() => _inputHomePageState();
}

class _inputHomePageState extends State<inputHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

//radio
  String? groupFood;
  List<Food>? foods;

//checkbox
  List checkDrink = []; //เก็บค่าที่เลือก
  List<Drink>? drinks; //เก็บรายการเครื่องดื่มจาก Class drink

  //dropdown
  List<ListItem>? types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectTypeItem;

  @override
  void initState() {
    super.initState();
    foods = Food.getFood();
    drinks = Drink.getDrink();

    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectTypeItem = _dropdownMenuItem[0].value!;
    print(foods![0].thName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widgets'),
      ),
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(8), 
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              usernameTextfield(),
              password(),
              SizedBox(height: 16),
              Column(
                children: createRadioFood(),
            ),
            SizedBox(height: 16),
            Text('Radio Selected :' + groupFood.toString()),
            Text(_username.text),
            Column(
              children: createCheckcoxDrink(),
            ),
            SizedBox(height: 16),
            DropdownButton(
              value: _selectTypeItem,
              items: _dropdownMenuItem,
              onChanged: (ListItem? value) {
                setState(() {
                  _selectTypeItem = value!;
                });
              },
            ),
            Text('Dropdown selected : ${_selectTypeItem.value}'),
            submit(),
          ],
        ),
        ),
        ),
         
      ],
        
      ),
    );
  }

  ElevatedButton submit() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print(_username.text);
        }
      },
      child: Text('Submit'),
    );
  }

  Widget usernameTextfield() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _username,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Username";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'usernamme',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        obscuringCharacter: '*',
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter password";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  List<Widget> createRadioFood() {
    List<Widget> listFood = [];

    for (var food in foods!) {
      listFood.add(
        RadioListTile<dynamic>(
          title: Text(food.thName!),
          subtitle: Text(food.enName!),
          secondary: Text('${food.price} บาท'),
          value: food.foodValue,
          groupValue: groupFood,
          onChanged: (value) {
            setState(() {
              groupFood = value;
            });
          },
        ),
      );
    }
    return listFood;
    //
  }

  List<Widget> createCheckcoxDrink() {
    List<Widget> listDrink = [];

    for (var drink in drinks!) {
      listDrink.add(
        CheckboxListTile(
          value: drink.checked,
          title: Text(drink.thName!),
          secondary: Text('${drink.price!} บาท'),
          onChanged: (value) {
            setState(() {
              drink.checked = value;
            });
            //เขียนโค้ดแสดง เพิ่มเติม แสดงรายการที่เราเลือก
            if (value!) {
              checkDrink.add(drink.thName);
            } else {
              checkDrink.remove(drink.thName);
            }

            print(checkDrink);
          },
        ),
      );
    }

    return listDrink;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem>? types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var type in types!) {
      items.add(DropdownMenuItem(
        child: Text(type.name!),
        value: type,
      ));
    }

    return items;
  }
}

class ListItem {
  int? value;
  String? name;

  //constructor
  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'เครื่องดื่ม'),
      ListItem(2, 'อาหารอีสาน'),
      ListItem(3, 'อาหารตามสั่ง'),
      ListItem(4, 'ขนม'),
    ];
  }
}
