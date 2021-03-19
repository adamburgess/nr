## nr ##

A faster `npm run`.

It's pretty simple to use: 
1. `npm install -g @adamburgess/nr`
2. replace `npm run X` with `nr X`

### Why? ###

1. npm _needs_ run for non-standard scripts. This sucks.
2. yarn and pnpm don't, but they add _100-200ms of startup time_.

This is generally fast. On my machine it takes 30ms.
