#!/usr/bin/python
import sys

import i3


USAGE = """i3-focus

usage: i3-focus {next|prev}"""


def windows_in_current_workspace():
    # Get the current workspace
    workspace = i3.filter(i3.get_workspaces(), focused=True)[0]
    # Find the node corresponding to the workspace
    wsnode = i3.filter(i3.get_tree(), num=workspace['num'], name=workspace['name'])[0]
    # Enumerate windows in the workspace
    windows = i3.filter(wsnode['nodes'], nodes=[])
    return windows


def focus_next():
    windows = windows_in_current_workspace()
    i = 0
    while not windows[i]['focused']:
        i += 1
    j = (i + 1) % len(windows)
    target_id = windows[j]['id']
    i3.focus(con_id=target_id)


def focus_prev():
    windows = windows_in_current_workspace()
    i = 0
    while not windows[i]['focused']:
        i += 1
    j = (i - 1) % len(windows)
    target_id = windows[j]['id']
    i3.focus(con_id=target_id)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        if sys.argv[1] == 'next':
            focus_next()
        elif sys.argv[1] == 'prev':
            focus_prev()
        else:
            print(USAGE)
    else:
        print(USAGE)
