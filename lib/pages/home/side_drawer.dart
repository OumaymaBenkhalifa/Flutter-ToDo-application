import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/pages/tasks/bloc/task_bloc.dart';
import 'package:flutter_app/pages/labels/label_db.dart';
import 'package:flutter_app/pages/projects/project_db.dart';
import 'package:flutter_app/pages/projects/project.dart';
import 'package:flutter_app/pages/about/about_us.dart';
import 'package:flutter_app/pages/home/home_bloc.dart';
import 'package:flutter_app/pages/labels/label_bloc.dart';
import 'package:flutter_app/pages/labels/label_widget.dart';
import 'package:flutter_app/pages/projects/project_bloc.dart';
import 'package:flutter_app/pages/projects/project_widget.dart';
import 'package:flutter_app/utils/keys.dart';
import 'package:flutter_app/utils/extension.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Task_Manager"),
            accountEmail: Text(""),
            otherAccountsPictures: <Widget>[],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              backgroundImage: AssetImage("assets/twitter_logo.png"),
            ),
          ),
          ListTile(
              leading: Icon(Icons.inbox),
              title: Text(
                "All Tasks",
                key: ValueKey(SideDrawerKeys.INBOX),
              ),
              onTap: () {
                var project = Project.getInbox();
                homeBloc.applyFilter(
                    project.name, Filter.byProject(project.id!));
                context.safePop();
              }),
          ListTile(
              onTap: () {
                homeBloc.applyFilter("Due Today", Filter.byToday());
                context.safePop();
              },
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Today's tasks",
                key: ValueKey(SideDrawerKeys.TODAY),
              )),
        ],
      ),
    );
  }
}
