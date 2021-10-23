import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/approver/approver_bloc.dart';
import 'package:flutter_template/core/inject/injection_container.dart';
import 'package:flutter_template/presentation/approver/widget/loading_widget.dart';
import 'package:flutter_template/presentation/approver/widget/message_display_widget.dart';

class ApproverPage extends StatelessWidget {
  const ApproverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApproverBloc>(
      create: (_) => sl<ApproverBloc>(),
      child: const ApproverPageContent(),
    );
  }
}

class ApproverPageContent extends StatelessWidget {
  const ApproverPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              BlocBuilder<ApproverBloc, ApproverBlocState>(
                builder: (_, state) {
                  if (state is InitialState) {
                    return const MessageDisplay(
                      message:
                          "Press the button to search for someone to approve your next MERGE REQUEST",
                    );
                  } else if (state is LoadedState) {
                    var approver = state.approver;
                    return Column(
                      children: [
                        const MessageDisplay(message: "The lucky WINNER is"),
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            child: SizedBox(
                              width: 300,
                              height: 100,
                              child: Center(
                                  child: Text(approver,
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ErrorState) {
                    return MessageDisplay(message: state.message);
                  } else {
                    return const LoadingWidget();
                  }
                },
              ),
              ElevatedButton(
                  child: const Text("Search"),
                  onPressed: () => context
                      .read<ApproverBloc>()
                      .add(GetRandomApproverEvent()))
            ],
          )
        ],
      ),
    );
  }
}
