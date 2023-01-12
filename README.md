This requires Nix with flakes support.

Reproduction steps:

```shell
nix develop
pnpm install
pnpm run dev
```

The error I'm getting:

```shell
$ pnpm run dev

> turborepo-test@1.0.0 dev /home/ag/code/pers/turbo.nix-test
> turbo run dev --parallel

thread 'main' panicked at 'Failed to execute turbo.: Os { code: 2, kind: NotFound, message: "No such file or directory" }', crates/turborepo/src/main.rs:23:10
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
 ELIFECYCLE  Command failed with exit code 101.
```
