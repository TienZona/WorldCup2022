import 'package:flutter/material.dart';
import 'package:world_cup_2022/models/nation.dart';
import 'package:world_cup_2022/ui/managers/match_manager.dart';
import 'package:world_cup_2022/ui/managers/nation_manager.dart';
import 'package:provider/provider.dart';
import '../shared/dialog_utils.dart';

import '../../models/match.dart';
import 'package:intl/intl.dart';
import '../shared/drawer.dart';

// import 'products_manager.dart';

class EditMatch extends StatefulWidget {
  static const routeName = '/edit-match';

   EditMatch(  
    Match? match, {
      super.key,
    }) {
      if(match == null){
        this.match = Match(
        id: null,
        date: '12-12-2022', 
        time: '12:00', 
        t1_name: 'Qatar',
        t1_goal: 0,
        t1_shot: 0,
        t1_onTarget: 0,
        t1_possession: 0,
        t1_foul: 0,
        t1_yellowCard: 0,
        t1_redCard: 0,
        t2_name: 'Anh',
        t2_goal: 0,
        t2_shot: 0,
        t2_onTarget: 0,
        t2_possession: 0,
        t2_foul: 0,
        t2_yellowCard: 0,
        t2_redCard: 0
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
  final _editForm = GlobalKey<FormState>();
  late Match _editedMatch;
  
  var dropdownValue;
  List<Nation> nations = NationManager().nations;

  @override 
  void initState(){

    _editedMatch = widget.match;
    timeinput.text = _editedMatch.time;
    dateInput.text = _editedMatch.date;
    super.initState();
    
  }

  @override 
  void dispose(){

    super.dispose();
  }
  // Future<void> _saveForm() async {
  //   try {
  //     final matchMangers = context.read<MatchManager>();
  //     if(_editedMatch.id != null){
  //       await matchMangers.updateMatch(_editedMatch);
  //     }else{
  //       await matchMangers.addMatch(_editedMatch);
  //     }
  //   }catch(error){
  //     await showErrorDialog(context, 'Something went wrong.');
  //   } 

  //   if(mounted){
  //     Navigator.of(context).pop();
  //   }
  // }
Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if(!isValid){
      return;
    }

    _editForm.currentState!.save();

    // setState(() {
    //   _isLoading = true;
    // });

    try {
      final productsManager = context.read<MatchManager>();
      if(_editedMatch.id != null){
        await productsManager.updateMatch(_editedMatch);
      }else{
        await productsManager.addMatch(_editedMatch);
      }
    }catch(error){
      await showErrorDialog(context, 'Something went wrong.');
    }

    // setState(() {
    //   _isLoading = false;
    // });

    if(mounted){
      Navigator.of(context).pop();
    }
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
                          const Text(
                            'Đội 1',
                            style: TextStyle(  
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildDropDownField(_editedMatch.t1_name, 1),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t1_goal.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard),
                                    labelText: 'Goal',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_goal: int.parse(value));
                                  },
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t1_shot.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    labelText: 'Số lần sút',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_shot: int.parse(value));

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
                                  initialValue: _editedMatch.t1_onTarget.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Sút trúng đích',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_onTarget: int.parse(value));
                                  },
                                  validator: (value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t1_possession.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: '0',
                                    labelText: 'Kiểm soát',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_possession: int.parse(value));
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
                                  initialValue: _editedMatch.t1_foul.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Phạm lỗi',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_foul: int.parse(value));
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t1_yellowCard.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ vàng',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_yellowCard: int.parse(value));
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
                                  initialValue: _editedMatch.t1_redCard.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ đỏ',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t1_redCard: int.parse(value));
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
                  ),
                  Container(
                    height: 500,
                    child: Padding(  
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Text(
                            'Đội 1',
                            style: TextStyle(  
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildDropDownField(_editedMatch.t2_name, 2),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t2_goal.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard),
                                    hintText: '0',
                                    labelText: 'Goal',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_goal: int.parse(value));
                                  },
                                )
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t2_shot.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Số lần sút',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_shot: int.parse(value));

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
                                  initialValue: _editedMatch.t2_onTarget.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Sút trúng đích',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_onTarget: int.parse(value));
                                  },
                                  validator: (value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t2_possession.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: '0',
                                    labelText: 'Kiểm soát',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_possession: int.parse(value));
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
                                  initialValue: _editedMatch.t2_foul.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Phạm lỗi',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_foul: 1);
                                  },
                                  validator: (String? value) {
                                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  initialValue: _editedMatch.t2_yellowCard.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ vàng',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_yellowCard: int.parse(value));
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
                                  initialValue: _editedMatch.t2_redCard.toString(),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.scoreboard_outlined),
                                    hintText: 'What do people call you?',
                                    labelText: 'Thẻ đỏ',
                                  ),
                                  onChanged: (value) {
                                    _editedMatch = _editedMatch.copyWith(t2_redCard: int.parse(value));
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
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), 
            labelText: "Ngày diễn ra" 
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value){
            if(value!.isEmpty){
              return 'Vui lòng chọn ngày thi đấu';
            }
            return null;
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
                _editedMatch = _editedMatch.copyWith(date: formattedDate);
              });
            } else {}
          },
        )
      )
    );
  }

  Widget buildTimeField(){
    return Container(
      padding: EdgeInsets.all(15),
      height: 100,
      child: Center( 
        child: TextFormField(
          controller: timeinput, 
          decoration: const  InputDecoration( 
              icon: Icon(Icons.timer), 
              labelText: "Thời gian bắt đầu" 
          ),
          readOnly: true, 
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
                _editedMatch = _editedMatch.copyWith(time: formattedTime);
              });
            }else{
                print("Time is not selected");
            }
          },
        )
      )
    );
  }

  DropdownButtonFormField buildDropDownField(String nation_name, int team){
    return DropdownButtonFormField(
      items: nations.map((nation) => 
        DropdownMenuItem(
          child:  Row(  
            children:  <Widget> [
              Image(
                image: NetworkImage(nation.imgURL),
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
      value: nation_name,
      validator: (value) => value == null ? "Select a country" : null,
      onChanged: (val) {
        setState(() {
          dropdownValue = val;
          if(team == 1){
            _editedMatch = _editedMatch.copyWith(t1_name: val);
          }else{ 
            _editedMatch = _editedMatch.copyWith(t2_name: val);
          }
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.deepPurple,
      ),
      decoration: const InputDecoration(  
        labelText: 'Đội tuyển',
        prefixIcon: Icon(  
          Icons.sports_soccer,
          color: Colors.deepPurple,
        )
      ),
    );
  }
}
