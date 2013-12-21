startR.dart
============

## What is startR?

* startR allows you to quickly use starting points for projects.
* startR follows [sublime](sublimetext.com) snippet syntax ${1}, ${2}, ${3}, ... ${n} (_Defaults ${n:default} are not yet supported._)

## Installation

1. Install [dart](https://www.dartlang.org)
2. Create executable script - _Optional But Recommended_ - 

	* __startr__

        ```bash
        #!/bin/bash
        STARTR_DIR="path/to/startr/dart"
        dart $STARTR_DIR/bin/startr.dart "$@"
        ```

	* make __startr__ executable:

		```bash
		$ chmod +x startr
		```

## Use

1. Copy git clone url from a github repo.  
     _Example_: `git@github.com:toolr/hw.angular.dart.startr.git` from [toolR/hw.angular.dart.startR](https://github.com/toolr/hw.angular.dart.startr)

2.  Run startR at your project directory:

    ```bash
    $ startr get <git clone url> [arguments] 
    ```

    _Example:_
    ```bash
    $ startr get git@github.com:toolr/hw.angular.dart.startr.git coolprojectname
    ```    
	
## Create a startR

Any github repo in any language can be a startR.  _See Example: [toolR/hw.angular.dart.startR](https://github.com/toolr/hw.angular.dart.startr)_

1.  Replace code throughout your project with ${1}, ${2}, ${3}, ... ${n}.

2.  Whenever you run startR and n arguments, it will replace accordingly.  It even works with filename.  _Directory names are not yet supported._

## Authors

* [Damon Douglas](http://github.com/damondouglas)
* You?

