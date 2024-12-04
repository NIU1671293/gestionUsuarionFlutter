import 'package:flutter/material.dart';

import 'data.dart';
import 'screen_info.dart';
import 'screen_actions.dart';
import 'screen_users.dart';
import 'screen_schedule.dart';

// Parameters
Color iconBackgroundColor = Color(0xFF3A4A6D);
double iconSizes = 70.0;

class ScreenGroups extends StatefulWidget {
  final UserGroup user;

  ScreenGroups({super.key, required this.user});

  @override
  State<ScreenGroups> createState() => _ScreenGroups();
}

/*

class _ScreenGroups extends State<ScreenGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text("Group " + widget.user.name),
        ),

        body: Center(
            child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,

                children: [
                  BotonAccion()._crearBoton(context, 'Info', Icon(
                      Icons.description,
                      color: Colors.white,
                      size: iconSizes,
                      ),
                      MaterialPageRoute<void>(
                        builder: (context) => ScreenInfo(user: widget.user),
                      )
                  ),
                  BotonAccion()._crearBoton(context, 'Schedule', Icon(
                    Icons.perm_contact_cal,
                    color: Colors.white,
                    size: iconSizes,
                    ),
                      MaterialPageRoute<void>(
                        builder: (context) => ScreenInfo(user: widget.user),
                      )
                  ),
                  BotonAccion()._crearBoton(context, 'Actions', Icon(
                    Icons.key,
                    color: Colors.white,
                    size: iconSizes,
                    ),
                      MaterialPageRoute<void>(
                        builder: (context) => ScreenInfo(user: widget.user),
                      )
                  ),
                  BotonAccion()._crearBoton(context, 'Places', Icon(
                    Icons.holiday_village,
                    color: Colors.white,
                    size: iconSizes,
                    ),
                      MaterialPageRoute<void>(
                        builder: (context) => ScreenInfo(user: widget.user),
                      )
                  ),
                  BotonAccion()._crearBoton(context, 'Users', Icon(
                    Icons.people,
                    color: Colors.white,
                    size: iconSizes,
                    ),
                      MaterialPageRoute<void>(
                        builder: (context) => ScreenInfo(user: widget.user),
                      )
                  ),


                  //Info
                  /*Container(
                      color: iconBackgroundColor,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => ScreenInfo(user: widget.user),
                            ));
                          },

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.description,
                                      color: Colors.white,
                                      size: iconSizes,
                                    ),
                                    Text(
                                      'Info',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                              ),
                        ),
                      ),
                  ),

                  //Schedule
                  Container(
                      color: iconBackgroundColor,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.perm_contact_cal),
                                  color: Colors.white,
                                  iconSize: iconSizes,
                                ),
                                Text(
                                  'Schedule',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]
                          )
                      )
                  ),

                  //Actions
                  Container(
                      color: iconBackgroundColor,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.key),
                                  color: Colors.white,
                                  iconSize: iconSizes,
                                ),
                                Text(
                                  'Actions',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]
                          )
                      )
                  ),

                  //Places
                  Container(
                      color: iconBackgroundColor,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.holiday_village),
                                  color: Colors.white,
                                  iconSize: iconSizes,
                                ),
                                Text(
                                  'Places',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]
                          )
                      )
                  ),

                  //Users
                  Container(
                      color: iconBackgroundColor,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: Colors.white,
                                  iconSize: iconSizes,
                                ),
                                Text(
                                  'Users',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]
                          )
                      )
                  ),*/
                ]
            )
        )
    );
  }
}


class BotonAccion extends StatelessWidget {
  bool _isSwitched = false;

  void navigate(BuildContext context, MaterialPageRoute<void> ventana) {
    if (_isSwitched){
      Navigator.push(context, ventana);
    } else {
      Navigator.pop(context);
    }
  }
  //Constructor
  Widget _crearBoton(BuildContext context, String accion, Icon icon, MaterialPageRoute<void> ventana) {
    return Container(

      color: iconBackgroundColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).push(ventana),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                accion,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }


  //build
  @override
  Widget build(BuildContext context) {
    return Container(
        color: iconBackgroundColor,
        //child: _crearBoton(context, 'test', Icon(Icons.perm_contact_cal), UserGroup('name', 'description', Data.defaultAreas, Data.defaultSchedule, Data.defaultActions, [User('name', 'credential')]))

    );
  }
}



 */
class _ScreenGroups extends State<ScreenGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text("Group ${widget.user.name}"),
        ),

        body: Center(
            child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,

                children: [
                  //Info
                  Container(
                      color: iconBackgroundColor,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenInfo(userGroup: widget.user),
                            )).then((var v) => setState(() {}));
                          },

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.description,
                                      color: Colors.white,
                                      size: iconSizes,
                                    ),
                                    const Text(
                                      'Info',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                              ),
                        ),
                      ),
                  ),

                  //Schedule
                  Container(
                    color: iconBackgroundColor,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenSchedule(userGroup: widget.user),
                          )).then((var v) => setState(() {}));
                        },

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.perm_contact_cal,
                              color: Colors.white,
                              size: iconSizes,
                            ),
                            const Text(
                              'Schedule',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Actions
                  Container(
                    color: iconBackgroundColor,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenActions(userGroup: widget.user),
                          )).then((var v) => setState(() {}));
                        },

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.key,
                              color: Colors.white,
                              size: iconSizes,
                            ),
                            const Text(
                              'Actions',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Places
                  Container(
                    color: iconBackgroundColor,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.holiday_village,
                              color: Colors.white,
                              size: iconSizes,
                            ),
                            const Text(
                              'Places',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Users
                  Container(
                    color: iconBackgroundColor,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenUsers(userGroup: widget.user),
                          )).then((var v) => setState(() {}));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people,
                              color: Colors.white,
                              size: iconSizes,
                            ),
                            const Text(
                              'Users',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}
