import 'package:startr/startr.dart';
import 'package:args/args.dart';

var _usage = {
	"get":{
		"description":"Get a project startr."
	}
};

void main(List<String> args) {
	if(args.length >= 2){
		if(args[0] == "get"){
			var url = args[1];
			print("fetching $url ...");
			args = args.length >= 3 ? args.sublist(2) : [];
			_get(url, args);
		}
	} else {
		_printUsage();
	}
}

void _get(String url, List<String> args){
	var repo = new Repo(url, args);
		repo.get_repo()
		.then((process){
			process.exitCode
			.then((exitCode){
				if(exitCode == 0){
					repo.build_startr()
					.then((_) => print('done.'));
				}
			});			
		});
}

void _printUsage(){

	String usage = """
Usage:

	startr <command> [<args>]

Commands:

	""";
	_usage.forEach((k,v){
		usage += "$k\t\t${v['description']}";
	});

	print(usage);
}