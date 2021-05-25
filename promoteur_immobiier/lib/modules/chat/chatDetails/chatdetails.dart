import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/messageModel.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ChatDetails extends StatelessWidget {
  UserModel userModel;
  var messageController = TextEditingController();

  ChatDetails({this.userModel});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppCubit.get(context)
            .getMessage(reciverId: "hhxD3nP8sBYMADgD0cL4hVGzkVg2");
        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://scontent.ftun4-1.fna.fbcdn.net/v/t1.6435-1/p160x160/120253793_328733324872508_6721364453949901830_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=7206a8&_nc_ohc=laGqxSwPIVUAX9g78xY&_nc_ht=scontent.ftun4-1.fna&tp=6&oh=be413284c083f00a3cb277c540167aae&oe=60D06A7A"),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("alliance")
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: AppCubit.get(context).messages.length >= 0,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var message = AppCubit.get(context).messages[index];
                            if (AppCubit.get(context).usermodel.uId ==
                                message.senderId) {
                              return buildMyMessage(message);
                            } else {
                              return buildMessage(message);
                            }
                          },
                          separatorBuilder: (context, states) => SizedBox(
                            height: 15,
                          ),
                          itemCount: AppCubit.get(context).messages.length,
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Ecrire votre message...')),
                            ),
                            Container(
                              height: 50,
                              color: kSecondaryColor,
                              child: MaterialButton(
                                onPressed: () {
                                  print('fff');
                                  AppCubit.get(context).sendMessage(
                                      reciverId: "hhxD3nP8sBYMADgD0cL4hVGzkVg2",
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text);
                                  print(messageController.text);
                                },
                                minWidth: 1,
                                child: Icon(
                                  Icons.send,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                )),
            child: Text(model.text)),
      );
  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                )),
            child: Text(model.text)),
      );
}
