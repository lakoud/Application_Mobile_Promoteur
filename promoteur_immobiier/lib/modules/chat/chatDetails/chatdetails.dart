import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
            .getMessage(reciverId: "7dw6lw4Dnogig88ofCXqLj0gV2w2");
        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                titleSpacing: -30.0,
                title: Container(
                    width: 250,
                    height: 250,
                    child: Image(
                        image: NetworkImage(
                      "https://www.entreprises-magazine.com/wp-content/uploads/2020/04/Groupe-Alliance.png",
                    ))),
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
                              return buildMyMessage(message, context);
                            } else {
                              return buildMessage(message, context);
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
                              color: kMainColor,
                              child: MaterialButton(
                                onPressed: () {
                                  print('fff');
                                  AppCubit.get(context).sendMessage(
                                      reciverId: "7dw6lw4Dnogig88ofCXqLj0gV2w2",
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text);
                                  messageController.clear();
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

  Widget buildMessage(MessageModel model, context) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                )),
            child: Text(
              model.text,
              style: GoogleFonts.merriweather(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontSize: 15,
                color: Colors.white,
              ),
            )),
      );
  Widget buildMyMessage(MessageModel model, context) => Align(
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
            child: Text(
              model.text,
              style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.subtitle1,
                fontSize: 15,
                color: Colors.white,
              ),
            )),
      );
}
