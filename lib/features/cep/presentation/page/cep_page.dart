import 'package:cep/common/constants/app_strings.dart';
import 'package:cep/features/cep/data/model/cep_model.dart';
import 'package:cep/features/cep/data/repository/cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final cepRepository = CepRepository(httpClient: Client());
  final cepController = TextEditingController();
  CepModel? cepDetails;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: AppStrings.cepLabel,
                    ),
                    controller: cepController,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final cep = await cepRepository.getCep(cepController.text);
                    setState(() {
                      cepDetails = cep;
                    });
                  },
                  icon: Icon(Icons.south_east),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Text(cepDetails?.uf ?? ''),
            title: Text(
              '${cepDetails?.complemento} - ${cepDetails?.logradouro} - ${cepDetails?.bairro} - ${cepDetails?.localidade} - ${cepDetails?.estado} - ${cepDetails?.regiao} - BR',
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Unidade: ${cepDetails?.unidade}'),
                      Text('IBGE: ${cepDetails?.ibge}'),
                      Text('GIA: ${cepDetails?.gia}'),
                    ],
                  ),
                ),
                SizedBox(height: 100, child: VerticalDivider()),
                Expanded(
                  child: Column(
                    children: [
                      Text('DDD: ${cepDetails?.ddd}'),
                      Text('SIAFI: ${cepDetails?.siafi}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
