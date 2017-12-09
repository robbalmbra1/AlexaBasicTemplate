#!/bin/bash
cd `dirname $0`
cd ../

# Cleans out test results
if [ -d build/results/ ]; then
	rm -r build/results/
fi
