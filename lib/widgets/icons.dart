
import 'package:flutter/cupertino.dart';
import 'package:getx/app/core/values/colors.dart';
import 'package:getx/app/core/values/icons.dart';

List<Icon> getIcons(){
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'), color: purple,),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: green,),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'), color: yellow,),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons'), color: deepPink,),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons'), color: lightBlue,),
  ];
}