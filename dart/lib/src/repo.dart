part of startr;

class Repo {

  String _url;
  List<String> _args;

  Repo(this._url, this._args);

  Future get_repo() {
    return _process('git', ['clone', this._url, '.'], 'cloning repo');
  }

  Future build_startr() {
    var completer = new Completer();

    var dir = new Directory('.git');

    if (dir.existsSync()) {
      dir.deleteSync(recursive:true);
    }

    dir = new Directory('.');
    dir.list(recursive:true)
    .forEach((FileSystemEntity fse) {
      if (fse is File) {
        var fh = new FileHandler(fse);
        fh.rename(_args)
        .then((file) {
          fh = new FileHandler(file);
          // var completer = new Completer();
          // completer.complete(file);
          // return completer.future;
          return fh.modify(_args);
        })
        .then((file) => print("Processed: ${file.path}"));
      }
    });
    completer.complete();
    return completer.future;
  }

  Future _process(String command, List<String> args, String message) {
    return Process.start(command, args)
        //.then((_) => print('$message...'))
        .then((int exitCode) => exitCode);
  }
}

class FileHandler {
  File _file;

  FileHandler(this._file);

  Future rename(List<String> args) {
    return _replace(_file.path, args)
    .then((path) => _file.rename(path));
  }

  Future modify(List<String> args) {
    return _read()
    .then((data) {
      if (data is List<int>) return _file.writeAsBytes(data);
      if (data is String) {
        var completer = new Completer();
        _replace(data, args)
        .then((data) => completer.complete(_file.writeAsString(data)));
        return completer.future;
      }
    });
  }

  Future<String> _replace(String text, List<String> args) {
    var completer = new Completer();

    String result = text;

    var index = 0;
    args.forEach((String a) {
      index = index + 1;
      String pattern = "\$\{${index}\}";
      result = result.replaceAll(pattern, a);
    });

    completer.complete(result);
    return completer.future;
  }

  Future _read() {
    String mimetype = mime.lookupMimeType(_file.path);

    if (mimetype != null) {
      if (mimetype.contains('image')) {
        return _file.readAsBytes();
      } else {
        return _file.readAsString();
      }
    } else {
      return _file.readAsString();
    }
  }
}