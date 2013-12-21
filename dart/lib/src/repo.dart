
part of startr;

class Repo {


	String _url;
	List<String> _args;

	Repo(this._url, this._args);

	Future get_repo(){
		return _process('git', ['clone',this._url, '.'],'cloning repo');
	}

	Future<String> _replace(String text, List<String> args){
		var completer = new Completer();

		String result = text;

		var index = 0;
		args.forEach((String a){
			index = index + 1;
			String pattern = "\$\{${index}\}";
			result = result.replaceAll(pattern, a);
		});

		completer.complete(result);

		return completer.future;
	}

	Future build_startr(){
		var completer = new Completer();

		var dir = new Directory('.git');

		 if(dir.existsSync()){
		 	dir.deleteSync(recursive:true);
		 }

		dir = new Directory('.');
		dir.list(recursive:true)
		.forEach((FileSystemEntity fse){
			if(fse is File){
				_replace(fse.path, _args)
				.then((path) => fse.renameSync(path))
				.then((fse) => fse.readAsString())
				.then((data) => _replace(data, _args))
				.then((data) => fse.writeAsString(data))
				.then((_) => print("Processed: ${fse.path}"));
			}
		});
		completer.complete();
		return completer.future;
	}

	Future _process(String command, List<String> args, String message){
		return Process.start(command, args)
	      //.then((_) => print('$message...'))
	      .then((int exitCode) => exitCode);
	}
}