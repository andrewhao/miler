#!/bin/bash

togeojson $1 > $1.geojson
togpx $1.geojson > $1.geojson.gpx

