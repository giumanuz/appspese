import 'package:appspese/common/constants.dart';
import 'package:appspese/common/title_page_widget.dart';
import 'package:appspese/common/payment.dart';
import 'package:flutter/material.dart';

class SpeseTotaliPage extends StatefulWidget {
  const SpeseTotaliPage({Key? key}) : super(key: key);

  @override
  State<SpeseTotaliPage> createState() => _SpeseTotaliPageState();
}

class _SpeseTotaliPageState extends State<SpeseTotaliPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitlePageWidget('Spese Totali'),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: esempiPayments.length,
            itemBuilder: (context, index) {
              return SpesaTile(
                  pagamento: esempiPayments[index],
                  onDismissed: (direction) {
                    setState(() {
                      esempiPayments.removeAt(index);
                    });
                  });
            },
          ),
        ))
      ],
    );
  }
}

class SpesaTile extends StatelessWidget {
  final Payment pagamento;
  final DismissDirectionCallback? onDismissed;

  const SpesaTile({required this.pagamento, Key? key, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    Card card = Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/personalPayment');
        },
        title: Text(
          pagamento.from,
        ),
        subtitle: Text(
          pagamento.data,
        ),
        trailing: Text(
          '${pagamento.amount.toStringAsFixed(2)} €',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20.0,
            fontFamily: 'Oxygen-Regular',
          ),
          textAlign: TextAlign.right,
        ),
        leading: CircleAvatar(
          child: Icon(categoriesToIcon[pagamento.category]),
        ),
      ),
    );

    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.0),
          color: Colors.red,
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: onDismissed,
      child: card,
    );
  }
}
