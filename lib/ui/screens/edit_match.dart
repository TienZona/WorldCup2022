import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/Nation.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import '../../models/Stats.dart';
import '../widgets.dart';

// import 'package:provider/provider.dart';
import '../../models/Match.dart';
import 'package:intl/intl.dart';
import '../shared/drawer.dart';
// import '../widgets/drop_down_button.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:provider/provider.dart';

// import 'products_manager.dart';

class EditMatch extends StatefulWidget {
  static const routeName = '/edit-match';

   EditMatch(  
    Match? match, {
      super.key,
    }) {
      if(match == null){
        this.match = Match(
        id: '1',
        date: '12-12-2022', 
        time: '12:00', 
        t1_id: '1',
        t1_goal: 1,
        t1_shot: 1,
        t1_onTarget: 1,
        t1_possession: 1,
        t1_foul: 1,
        t1_yellowCard: 1,
        t1_redCard: 1,
        t2_id: '1',
        t2_goal: 1,
        t2_shot: 1,
        t2_onTarget: 1,
        t2_possession: 1,
        t2_foul: 1,
        t2_yellowCard: 1,
        t2_redCard: 1
      );
      }else{
        this.match = match;
      }
    }

  late final Match match;

  @override
  State<EditMatch> createState() => _EditMatchState();
}

class _EditMatchState extends State<EditMatch> {
  // EditMatch(  
  TextEditingController timeinput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
   Match? _editedMatch;
  
  var dropdownValue;
  List<Nation> nations = NationManager().nations;

  @override 
  void initState(){

    _editedMatch = widget.match;
    super.initState();
    
  
  }

  @override 
  void dispose(){
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }
  Future<void> _saveForm() async {
    // final isValid = _editForm.currentState!.validate();
    // if(!isValid){
    //   return;
    // }

    // _editForm.currentState!.save();

    // print(_editedMatch.date);
    // print(_editedMatch.time);
    print(_editedMatch?.date);
    print(_editedMatch?.t1_goal);

    // print(_editedMatch.t2_goal);

    // final isValid = _editForm.currentState!.validate();
    // if(!isValid){
    //   return;
    // }

    // _editForm.currentState!.save();

    // setState(() {
    //   _isLoading = true;
    // });

    // // try {
    // //   final productsManager = context.read<ProductsManager>();
    // //   if(_editedMatch.id != null){
    // //     await productsManager.updateProduct(_editedMatch);
    // //   }else{
    // //     await productsManager.addProduct(_editedMatch);
    // //   }
    // // }catch(error){
    // //   await showErrorDialog(context, 'Something went wrong.');
    // // }

    // setState(() {
    //   _isLoading = false;
    // });

    // if(mounted){
    //   Navigator.of(context).pop();
    // }
  }

  @override 
  Widget build(BuildContext context){
    // print(_editedMatch.t1_goal);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập Nhật Trận Đấu'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(  
        constraints: BoxConstraints(
          // maxHeight: 400.0,
        ),
        child: Padding(  
            padding: EdgeInsets.all(10.0),
            child: Form(  
              key: _editForm,
              child: ListView(  
                children: [
                  buildDateField(),
                  buildTimeField(),
                  Container(
                    height: 500,
                    child: Padding(  
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget> [
                          Text(
                            'Đội 1',
                            style: TextStyle(  
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10),
                          buildDropDownField(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch?.t1_goal.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard),
                                    labelText: 'Goal',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t1_goal: int.parse(value!));
                                  },
                                )
                              ),
                            ],
                          ),
                          // SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_shot.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           labelText: 'Số lần sút',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_shot: int.parse(value!));

                          //         },
                          //         validator: (value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       )
                          //     ),
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_onTarget.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           hintText: 'What do people call you?',
                          //           labelText: 'Sút trúng đích',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_onTarget: int.parse(value!));
                          //         },
                          //         validator: (value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_possession.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           hintText: '0',
                          //           labelText: 'Kiểm soát',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_possession: int.parse(value!));
                          //         },
                          //         validator: (String? value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       )
                          //     ),
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_foul.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           hintText: 'What do people call you?',
                          //           labelText: 'Phạm lỗi',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_foul: int.parse(value!));
                          //         },
                          //         validator: (String? value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_yellowCard.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           hintText: 'What do people call you?',
                          //           labelText: 'Thẻ vàng',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_yellowCard: int.parse(value!));
                          //         },
                          //         validator: (String? value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       )
                          //     ),
                          //     Container(
                          //       width: 160,
                          //       padding: const EdgeInsets.all(8),
                          //       child: TextFormField(
                          //         initialValue: _editedMatch.t1_redCard.toString(),
                          //         textInputAction: TextInputAction.next,
                          //         keyboardType: TextInputType.number,
                          //         decoration: const InputDecoration(
                          //           icon: Icon(Icons.scoreboard_outlined),
                          //           hintText: 'What do people call you?',
                          //           labelText: 'Thẻ đỏ',
                          //         ),
                          //         onSaved: (value) {
                          //           _editedMatch = _editedMatch.copyWith(t1_redCard: int.parse(value!));
                          //         },
                          //         validator: (String? value) {
                          //           return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    )
                  ),
                  Container(
                    height: 500,
                    child: Padding(  
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Đội 1',
                            style: TextStyle(  
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10),
                          buildDropDownField(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard),
                                    hintText: '0',
                                    labelText: 'Goal',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_goal: 1);
                                  },
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Số lần sút',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_shot: 1);

                                  },
                                  validator: (value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                )
                              ),
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Sút trúng đích',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_onTarget: 1);
                                  },
                                  validator: (value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: '0',
                                    labelText: 'Kiểm soát',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_possession: 1);
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                )
                              ),
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Phạm lỗi',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_foul: 1);
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ vàng',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_yellowCard: int.parse(value!));
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                )
                              ),
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ đỏ',
                                  ),
                                  onSaved: (value) {
                                    _editedMatch = _editedMatch?.copyWith(t2_redCard: 1);
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
      )
    );
  }

  
  

  Widget buildDateField(){
    return Container(
      padding: EdgeInsets.all(15),
      height: 100,
      child: Center(
        child: TextFormField(
          controller: dateInput,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today), 
            labelText: "Ngày diễn ra" 
          ),
          // initialValue: _editedMatch.date,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value){
            if(value!.isEmpty){
              return 'Vui lòng chọn ngày thi đấu';
            }
            return null;
          },
          onSaved: (value){
            _editedMatch = _editedMatch?.copyWith(date: value);
          },
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));
            if (pickedDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                dateInput.text = formattedDate; 
              });
            } else {}
          },
        )
      )
    );
  }

  // TextEditingController timeinput = TextEditingController(); 
  //text editing controller for text field
  
  // @override
  // void initState() {
  //   timeinput.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  Widget buildTimeField(){
    return Container(
      padding: EdgeInsets.all(15),
      height: 100,
      child: Center( 
        child: TextFormField(
          controller: timeinput, 
          decoration: InputDecoration( 
              icon: Icon(Icons.timer), 
              labelText: "Thời gian bắt đầu" 
          ),
          readOnly: true, 
          onSaved: (value){
            _editedMatch = _editedMatch?.copyWith(time: value);
          },
          validator: (value){
            if(value!.isEmpty){
              return 'Vui lòng chọn thời gian bắt đầu';
            }
            return null;
          },
          onTap: () async {
            TimeOfDay? pickedTime =  await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );
            if(pickedTime != null ){
              DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
            
              String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
              setState(() {
                timeinput.text = formattedTime; 
              });
            }else{
                print("Time is not selected");
            }
          },
        )
      )
    );
  }

  // Widget StatsTeam1(){
  //   return 
    
  // }

  DropdownButtonFormField buildDropDownField(){
    return DropdownButtonFormField(
      items: nations.map((nation) => 
        DropdownMenuItem(
          child: Row(  
            children: [
              Image.asset(
                nation.logo,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 20),
               Text(nation.name)
            ],
          ),
          value: nation.name
        )
      ).toList(), 
      validator: (value) => value == null ? "Select a country" : null,
      onChanged: (val) {
        setState(() {
          dropdownValue = val;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: InputDecoration(  
        labelText: 'Đội tuyển',
        prefixIcon: Icon(  
          Icons.sports_soccer,
          color: Colors.deepPurple,
        )
      ),
    );
  }

  // Widget DropdownButtonFormField() {
  // //   var items = [   
  // //   'Item 1',
  // //   'Item 2',
  // //   'Item 3',
  // //   'Item 4',
  // //   'Item 5',
  // // ];
  //   return Center(
  //     child: Container(
  //         padding: EdgeInsets.all(16),
  //         child: DropDownFormField(
  //           titleText: 'My workout',
  //           hintText: 'Please choose one',
  //           value: '123',
  //           onSaved: (value) {
  //             // setState(() {
  //             //   _myActivity = value;
  //             // });
  //           },
  //           onChanged: (value) {
  //             // setState(() {
  //             //   _myActivity = value;
  //             // });
  //           },
  //           dataSource: [
  //             {
  //               "display": "Running",
  //               "value": "Running",
  //             },
  //             {
  //               "display": "Climbing",
  //               "value": "Climbing",
  //             },
  //             {
  //               "display": "Walking",
  //               "value": "Walking",
  //             },
  //             {
  //               "display": "Swimming",
  //               "value": "Swimming",
  //             },
  //             {
  //               "display": "Soccer Practice",
  //               "value": "Soccer Practice",
  //             },
  //             {
  //               "display": "Baseball Practice",
  //               "value": "Baseball Practice",
  //             },
  //             {
  //               "display": "Football Practice",
  //               "value": "Football Practice",
  //             },
  //           ],
  //           textField: 'display',
  //           valueField: 'value',
  //         ),
  //       ),
  //       // Container(
  //       //   padding: EdgeInsets.all(8),
  //       //   child: ElevatedButton(
  //       //     child: Text('Save'),
  //       //     onPressed: _saveForm,
  //       //   ),
  //       // ),
  //       // Container(
  //       //   padding: EdgeInsets.all(16),
  //       //   child: Text('123'),
  //       // )
  //   );
  // }

  // TextFormField buildPriceField(){
  //   return TextFormField(
  //     initialValue: '_editedMatch.price.toString()',
  //     decoration: const InputDecoration(labelText: 'Price'),
  //     textInputAction: TextInputAction.next,
  //     keyboardType: TextInputType.number,
  //     validator: (value){
  //       if(value!.isEmpty){
  //         return 'Please enter a price.';
  //       }
  //       if(double.tryParse(value) == null){
  //         return 'Please enter a valid number.';
  //       }
  //       if(double.parse(value) <= 0){
  //         return 'Please enter a number greater than zero.';
  //       }
  //       return null;
  //     },
  //     onSaved: (value){
  //       _editedMatch = _editedMatch.copyWith(price: double.parse(value!));
  //     },
  //   );
  // }

  // TextFormField buildDescriptionField(){
  //   return TextFormField(
  //     initialValue:  _editedMatch.description,
  //     decoration: const InputDecoration(labelText: 'Description'),
  //     maxLines: 3,
  //     keyboardType: TextInputType.multiline,
  //     validator: (value) {
  //       if(value!.isEmpty){
  //         return 'Please enter a description.';
  //       }
  //       if(value.length < 10){
  //         return 'Should be at least 10 characters long.';
  //       }
  //       return null;
  //     },
  //     onSaved: (value){
  //       _editedMatch = _editedMatch.copyWith(description: value);
  //     },
  //   );
  // }

  // Widget buildProductPreview(){
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.end,
  //     children: <Widget>[
  //       Container(  
  //         width: 100,
  //         height: 100,
  //         margin: const EdgeInsets.only(
  //           top: 8,
  //           right: 10,
  //         ),
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //             width: 1,
  //             color: Colors.grey
  //           )
  //         ),
  //         child: _imageUrlController.text.isEmpty
  //           ? const Text('Enter a URL')
  //           :FittedBox(
  //             child: Image.network(
  //               _imageUrlController.text,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //       ),
  //       Expanded(
  //         child: buildImageURLField(),
  //       )
  //     ],
  //   );
  // }

  // TextFormField buildImageURLField(){
  //   return TextFormField(
  //     decoration: const InputDecoration(labelText: 'Image URL'),
  //     keyboardType: TextInputType.url,
  //     textInputAction: TextInputAction.done,
  //     controller: _imageUrlController,
  //     focusNode: _imageUrlFocusNode,
  //     onFieldSubmitted: (value) => _saveForm(),
  //     validator: (value){
  //       if(value!.isEmpty){
  //         return 'Please enter an image URL.';
  //       }
  //       if(!_isValidImageUrl(value)){
  //         return 'Please enter a valid image URL.';
  //       }
  //       return null;
  //     },
  //     onSaved: (value){
  //       _editedMatch = _editedMatch.copyWith(imageUrl: value);
  //     },
  //   );
  // }
}
