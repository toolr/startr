startR
========

## What is startR?

* startR allows you to quickly use starting points for projects.
* startR follows [sublime](sublimetext.com) snippet syntax ${1}, ${2}, ${3}, ... ${n} (_Defaults ${n:default} are not yet supported._)

## Installation

Follow instructions respectively for [dart](https://github.com/toolr/startr/dart) or [python](https://github.com/toolr/startr/python) versions.

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

