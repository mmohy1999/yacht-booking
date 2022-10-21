import '../model/yacht.dart';
import 'package:scoped_model/scoped_model.dart';

class ConnectedModel extends Model{
  final List<Yacht>  _yachtList =  [
    Yacht(
      id:'1',
      name : 'Atlandita',
      isBookmark: true,
      hasTag: 'Yatching',
      price: '1000',
      length: '22',
      height: '12',
      draft: '12',
      image: 'assets/image/yacht_side_1.png',
      detailImage: 'assets/image/yacht_1.png',
     ),
      Yacht(
        id:'2',
      name : 'Hakamai',
      isBookmark: true,
      hasTag: 'Yatching',
      price: '5000',
      length: '43',
      height: '23',
      draft: '16',
      image: 'assets/image/yacht_side_2.png',
      detailImage: 'assets/image/yacht_2.png',
     ),
      Yacht(
        id:'3',
      name : 'Feisla',
      isBookmark: true,
      hasTag: 'Yatching',
      price: '18000',
      length: '42',
      height: '23',
      draft: '34',
      image: 'assets/image/yacht_side_3.png',
      detailImage: 'assets/image/yacht_3.png',
     ),
      Yacht(
        id:'4',
      name : 'Louise',
      isBookmark: true,
      hasTag: 'Yatching',
      price: '1500',
      length: '32',
      height: '24',
      draft: '54',
      image: 'assets/image/yacht_side_4.png',
      detailImage: 'assets/image/yacht_4.png',
     ),
      Yacht(
        id:'5',
      name : 'Mistas',
      isBookmark: true,
      hasTag: 'Yatching',
      price: '92000',
      length: '54',
      height: '36',
      draft: '82',
      image: 'assets/image/yacht_side_5.png',
      detailImage: 'assets/image/yacht.png',
     ),

  ];
}
class YachtModel extends ConnectedModel {
  List<Yacht> get allYacht {
    return List.from(_yachtList);
  }
  late int _selectedYachtId;
  void setSelectedYachtId(int id){
    _selectedYachtId = id;
  }
   Yacht get selectedProductIndex {
    return _yachtList.firstWhere((x) {
      return x.id ==_selectedYachtId.toString();
    });
  }
}