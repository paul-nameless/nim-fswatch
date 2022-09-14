import libfswatch

type
  Monitor* = object
    handle*: ptr fsw_handle


proc newMonitor*(monitor_type:fsw_monitor_type = system_default_monitor_type): Monitor =
  if fsw_init_library() != 0:
    echo "Error init library"
    quit(QuitFailure)
  result.handle = fsw_init_session(monitor_type.cint)

proc addPath*(monitor: Monitor, path: string) =
  if monitor.handle.fsw_add_path(path) != 0:
    echo "Error adding path"
    quit(QuitFailure)

proc setCallback*(monitor: Monitor, callback: proc(event: fsw_cevent, event_num: cuint)) =
  if monitor.handle.fsw_set_callback(callback) != 0:
    echo "Error setting callback"
    quit(QuitFailure)

proc start*(monitor: Monitor) =
  discard monitor.handle.fsw_start_monitor()
