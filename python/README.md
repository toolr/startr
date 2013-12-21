startR.py
============

## What is startR?

* startR allows you to quickly use starting points for projects.
* startR follows [sublime](http://www.sublimetext.com) snippet syntax ${1}, ${2}, ${3}, ... ${n} (_Defaults ${n:default} are not yet supported._)

## Installation

1. Install [python](https://www.python.org)
2. Execute the following command to make executable run anywhere:

    ```bash
    $ ln -s path/to/startr /usr/local/bin/startr
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

2.  Whenever you run startR and n arguments, it will replace accordingly.  It even works with filenames.  _Directory names are not yet supported._

## Authors

* [Damon Douglas](http://github.com/damondouglas)
* You?

