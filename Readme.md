# Cribl input PQ (persistent queue) monitor
Current status: **beta release**.

## Description
This code is meant to be run in a loop on a cribl worker node under a user that can read the `/opt/cribl/state/queues/*/inputs/` directory. Code is refreshed every 0.5s. This version assumes that PQ for input is enabled and at least queue 0 or more will exist.

Next versions may have  more options.

## To run:
- clone to a directory you can write to and execute from
- run as user that has access to `/opt/cribl/state/queues/*/inputs/`
- kill by CTL+C

## Author
Eduard Breuer

## Date of creation 
2024-08-16
