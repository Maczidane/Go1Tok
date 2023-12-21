class StateModel {
  const StateModel(this.name, this.code);
  final String code;
  final String name;

  @override
  String toString() => name;


}



/// Calll this in the code page
/*
showMaterialScrollPicker<StateModel>(
context: context,
title: 'Pick Your State',
items: usStates,
selectedItem: selectedUsState,
onChanged: (value) => setState(() => selectedUsState = value),
);

 */