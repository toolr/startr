import 'package:startr/startr.dart';
import 'package:args/args.dart';

void main(List<String> args) {
	if(args.length >= 2){
		if(args[0] == "get"){
			var url = args[1];
			print("fetching $url ...");
			args = args.length >= 3 ? args.sublist(2) : [];
			var repo = new Repo(url, args);
			repo.get_repo()
			.then((_){
				repo.build_startr()
				.then((_){
					print("done.");
				});
			});
		}
	}
}

void _get(ArgResults results){

}
