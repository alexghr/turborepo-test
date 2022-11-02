setup direnv

https://github.com/nix-community/nix-direnv/

then allow it to execute `.envrc`

```
direnv allow
```

now you should have `$TURBO_BINARY_PATH` defined and you should be able to `npm install` cleanly
