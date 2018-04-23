#!/bin/bash
scheme < $(find *.scm -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2 -d" ")
