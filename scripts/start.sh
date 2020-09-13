#!/usr/bin/env bash

REDWOOD_PORT="${PORT:-8080}"
printf "[api]\n  port = $REDWOOD_PORT\n" > './redwood.toml'
yarn redwood db up
yarn redwood db seed
yarn redwood dev api
