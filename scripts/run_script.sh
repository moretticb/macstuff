#!/bin/sh

cmd="$(find $HOME/scripts | grep sh$ | choose -m)"

$cmd
