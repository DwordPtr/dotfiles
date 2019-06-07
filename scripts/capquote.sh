#!/bin/bash
grep -o '".*"' | sed 's/"//g'
