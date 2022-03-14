import 'package:flutter/material.dart';
import 'package:job_posting/base/styles.dart';
import 'package:job_posting/models/job_post.dart';
import 'package:job_posting/screens/add_job.dart';
import 'package:job_posting/screens/edit_job.dart';
import 'package:job_posting/widgets/input_field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<JobPost> items = [];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        floatingActionButton: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            backgroundColor: appSecondaryColor,
            onPressed: () {
              Navigator.of(context)
                  .push<JobPost>(MaterialPageRoute(builder: (_) => AddJob()))
                  .then((value) => setState(() {
                        if (value!.title.isNotEmpty &&
                            value!.description.isNotEmpty) {
                          items.add(JobPost(
                              value?.title ?? "", value?.description ?? ""));
                        }
                      }));
            },
            child: const Icon(
              Icons.add,
              size: 50,
              color: appPrimaryColor,
            ),
          ),
        ),
        backgroundColor: appPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 79, left: 27, right: 27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 18,
                      color: appSecondaryColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const ImageIcon(AssetImage("images/logout.png"), color: appSecondaryColor, size: 40),
              ],
            ),
            const Text(
              "Jamal Ashrafi",
              style: TextStyle(
                  fontSize: 25,
                  color: appSecondaryColor,
                  fontFamily: "Poppins",
                  letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 19),
            const InputField(placeholderText: "Search keywords.", isIcon: true),
            const SizedBox(height: 15),
            Expanded(
              child: items.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
                      itemBuilder: cards,
                    )
                  : const Center(
                      child: Text(
                      "No job posted yet!",
                      style: TextStyle(
                          fontSize: 30,
                          color: appTextColor,
                          fontFamily: "Poppins"),
                    )),
            )
          ]),
        ));
  }

  Widget cards(BuildContext context, int index) => Card(
        color: appCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
          child: ListTile(
            title: Text(items[index].title,
                style: const TextStyle(
                    color: appSecondaryColor,
                    fontSize: 15,
                    fontFamily: "Poppins",
                  fontWeight: FontWeight.w600
                )),
            subtitle: Text(items[index].description,
                style: const TextStyle(
                    color: appTextColor,
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push<JobPost>(MaterialPageRoute(
                              builder: (_) => EditJob(
                                  title: items[index].title,
                                  description: items[index].description)))
                          .then((value) => setState(() {

                                if (value!.title.isNotEmpty &&
                                    value!.description.isNotEmpty) {
                                  items[index].title = value?.title ?? "";
                                  items[index].description =
                                      value?.description ?? "";
                                }
                              }));
                    },
                    icon: const ImageIcon(AssetImage("images/edit.png")), color: appSecondaryColor),
                IconButton(
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    icon: const ImageIcon(AssetImage("images/delete.png"), color: Colors.red)),
              ],
            ),
          ),
        ),
      );
}
