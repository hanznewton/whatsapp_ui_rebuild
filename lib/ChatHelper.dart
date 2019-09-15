import './ChatItemModel.dart';

class ChatHelper {
  static var chatList = [ChatItemModel("Hanz Newton", "Lunch in the evening?", "15/09/2019"),ChatItemModel("Pikin 4 Sun", "Skrrrrrrrrrr", "15/09/2019"),ChatItemModel("Frank Pascal", "Meet this week?", "15/09/2019"),
  ChatItemModel("Rosius Trey", "Repository Received!", "15/09/2019"),ChatItemModel("Belinda", "Do you still love me?", "15/09/2019"), ChatItemModel("Stacey", "You broke ma heart NH", "15/09/2019")];
static ChatItemModel getChatItem (int position){
  return chatList[position];
}
static var itemCount = chatList.length;}