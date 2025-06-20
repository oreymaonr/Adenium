import 'package:flutter/material.dart';
import 'package:plantapp/Data/plant.dart';

/// This is the UI of a single [Plant] TILE
/// multiple of these instances are created with to form a long list of plants
class PlantTile extends StatefulWidget {
  PlantTile({
    Key? key,
    required this.plant,
    required this.onPlantOrgChange,
    required this.heroDisplay,
    required this.displayPlantName,
    required this.displayplantid,
    required this.malayalam,
  }) : super(key: ObjectKey(plant));

  final Plant plant;
  final bool malayalam;
  final dynamic onPlantOrgChange;
  final dynamic heroDisplay;
  final String displayPlantName;
  final String displayplantid;

  @override
  State<PlantTile> createState() => _PlantTileState();
}

class _PlantTileState extends State<PlantTile> {
  @override
  Widget build(BuildContext context) {
    String year = "", day = "", month = "";
    if (widget.plant.plantdate.length > 9) {
      year = widget.plant.plantdate.substring(0, 4);
      month = widget.plant.plantdate.substring(5, 7);
      day = widget.plant.plantdate.substring(8, 10);
    }
    String noteyear = "", noteday = "", notemonth = "";
    if (widget.plant.plantnote.length > 9) {
      noteyear = widget.plant.plantnote.substring(0, 4);
      notemonth = widget.plant.plantnote.substring(5, 7);
      noteday = widget.plant.plantnote.substring(8, 10);
    }

    return GestureDetector(
      onTap: () {
        widget.heroDisplay(widget.plant);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor:
                      widget.displayplantid.trim() ==
                              widget.plant.plantid.trim()
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                  radius: 18,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/pflanzen.png"),
                  ),
                ),
                SizedBox(width: 5),
                Material(
                  elevation: 2,
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color:
                          widget.displayplantid.trim() ==
                                  widget.plant.plantid.trim()
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget.plant.plantname,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.plant.plantdate.length > 9
                        ? Text(
                          "$day.$month.$year",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                        : Text(
                          "no date",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                    widget.plant.plantnote.length > 9 &&
                            widget.plant.plantnote.isNotEmpty
                        ? Text(
                          "${widget.malayalam ? "അറിയിപ്പ്" : "notification"} :$noteday.$notemonth.$noteyear",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                        : Text(
                          "no notification",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                  ],
                ),
                if (widget.plant.plantid == widget.displayplantid)
                  IconButton(
                    onPressed: () {
                      widget.onPlantOrgChange(widget.plant, widget.malayalam);
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 25,
                    // color: Theme.of(context).colorScheme.tertiary,
                    // style: IconButton.styleFrom(
                    //   foregroundColor: Theme.of(context).colorScheme.primary,
                    // ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            Material(
              color: Theme.of(context).colorScheme.surface,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color:
                      widget.displayplantid.trim() ==
                              widget.plant.plantid.trim()
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(
                  textAlign: TextAlign.justify,
                  widget.plant.plantdetails,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
