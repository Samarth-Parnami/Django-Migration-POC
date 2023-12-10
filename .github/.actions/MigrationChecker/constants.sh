#!/bin/bash


if [ -z "$MIGRATION_FORMAT" ]; then
    readonly MIGRATION_FORMAT="*.py$"
fi

if [ -z "$ALLOWED_MIGRATION_FORMAT" ]; then
    readonly ALLOWED_MIGRATION_FORMAT="^[0-9]{4}_.*\.py$"
fi
if [ -z "$TICK" ]; then
    readonly TICK="\xE2\x9C\x94"
fi
if [ -z "$CROSS" ]; then
    readonly CROSS="\xE2\x9D\x8C"
fi
