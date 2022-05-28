import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/screens/details/index.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required DetailsBloc detailsBloc,
    Key? key,
  })  : _detailsBloc = detailsBloc,
        super(key: key);

  final DetailsBloc _detailsBloc;

  @override
  DetailsScreenState createState() {
    return DetailsScreenState();
  }
}

class DetailsScreenState extends State<DetailsScreen> {
  DetailsScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
        bloc: widget._detailsBloc,
        builder: (
          BuildContext context,
          DetailsState currentState,
        ) {
          if (currentState is UnDetailsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorDetailsState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is InDetailsState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                  const Text('Flutter files: done'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text('throw error'),
                      onPressed: () => _load(true),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load([bool isError = false]) {
    widget._detailsBloc.add(LoadDetailsEvent(isError));
  }
}
