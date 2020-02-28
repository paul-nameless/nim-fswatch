# Nim fswatch

Nim binding to [libfswatch](https://github.com/emcrisostomo/fswatch)


## Install

```sh
brew install fswatch
nimble install libfswatch
```


## Usage

```nim
import libfswatch
import libfswatch/fswatch

proc callback(event: fsw_cevent, event_num: cuint) =
  echo event.path

var mon = newMonitor()

mon.addPath("/tmp/test/")
mon.setCallback(callback)

mon.start()
```
