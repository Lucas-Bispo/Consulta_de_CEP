import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as hattp;

void main() {

  querySelector('#search').onClick.listen((a) async{
    String cep = (querySelector("#cep") as InputElement).value;
    String url = 'http://viacep.com.br/ws/$cep/json/';

    var http;
    var response = await http.get(url);
    var body = json.decode(response.body);
    print(body);

  (querySelector("#state") as InputElement).value = body['uf'];
  (querySelector("#city") as InputElement).value = body['localidade'];
  (querySelector("#neighborhood") as InputElement).value = body['bairro'];
  (querySelector("#street") as InputElement).value = body['logradouro'];
  });
}
