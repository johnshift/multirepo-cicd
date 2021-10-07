# Main Repo using multiple repositories:
- [johnshift/multirepo-backend](github.com/johnshift/multirepo-backend)
- [johnshift/multirepo-frontend](github.com/johnshift/multirepo-frontend)

## Uses submodules
- `git submodule add http://github.com/johnshift/multirepo-frontend frontend`
- `git submodule add http://github.com/johnshift/multirepo-backend backend`

## When pulling locally
- always use `git pull origin <branch> --recurse-submodules`

## known issues
- vercel cli `--env` does not allow whitespace (very annoying when using environment variables in ci)
- vitejs unstable jest typescript support for import.meta