import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({
    super.key,
    required this.selected,
    this.style,
    required this.onPressed,
    required this.child,
  });

  final bool selected;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  late final MaterialStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = MaterialStatesController(
        <MaterialState>{if (widget.selected) MaterialState.selected});
  }

  @override
  void didUpdateWidget(SelectableButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      statesController.update(MaterialState.selected, widget.selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      statesController: statesController,
      style: widget.style,
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Challenges{
  bool selected;
  String challenges;
  String details;

  Challenges( this.selected,  this.challenges,  this.details);
}



class _HomePageState extends State<HomePage> {




  List challenges = [
    Challenges(false, "Tree", "Grow the Tree"),
  Challenges(false, "Tree", "Save the Tree"),
  Challenges(false, "Tree", "Plant the Tree"),

  ];

  // bool selected = false;
  // List challenges = ["Tree", "Tree", "Tree"];
  // List details = ["Plant the tree", "Grow the tree", "Save the tree"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Text('Challenges'),
        elevation: 0,
        backgroundColor: Colors.red[200],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {


          return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55.0,
                        height: 55.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 100,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27,
                            backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/653/653851.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(challenges[index].challenges, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text(challenges[index].details, style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: SelectableButton(
                      selected: challenges[index].selected,
                      style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.white;
                          }
                          return null;
                        },
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if(states.contains(MaterialState.selected)){
                            return Colors.red[200];
                          }
                          return null;
                        },
                      ),
                      ),
                      onPressed: (){
                        setState(() {
                          challenges[index].selected = !challenges[index].selected;
                        });
                      },
                      child: Text('Accepted', style: TextStyle(color: Colors.grey[400])),
          
                      ),
                      ),
                    /* child: TextButton(
                      child: Text("Accept", style: TextStyle(color: Colors.white)),
                      style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red[200]),
                      onPressed: () {
                        print('Accept?');
                      },
                    ), */
                  
                ],
              ),
            ),
      )
    );
  }
  )
    );

  }
}