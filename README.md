# Bad-Axios Hunter #

## About ##

Searches for projects with dependencies that may have been compromised by malicious [axios / plain-crypto-js](https://content.govdelivery.com/accounts/USDHSCISA/bulletins/413c7a5).

Uses [jq](https://jqlang.org/) to parse [affected-packages.json](./affected-packages.json) and then recursively `grep` each package name in lock files found in the named directory.

The `affected-packages.json` file was created from the list of known, affected packages published by [socket.dev](https://socket.dev/blog/ongoing-supply-chain-attack-targets-crowdstrike-npm-packages).


## Prerequites ##

- `bash`
- `jq`


## Usage ##

```sh
# Scan a named directory with package names extracted from affected-packages.json
bad-axios.sh <directory> {affected-packages.json}

# Test scan on files in the ./test/ folder
bad-axios.sh -t
```


## Modification log ##

20 April 2025
- Initial fork as 'bad-axios-hunter'

24 Sep 2025
- Refine logic to evaluate only package-lock.json, yarn.lock, and pnpm-lock.yaml files  
- Replace affected-packages.json contents with more up-to-date list grabbed from https://socket.dev/

23 Sep 2025
- Initial creation (shai-hlud-hunter)


## Additional Resources ##

- <https://github.com/axios/axios/issues/10636>
- <https://www.microsoft.com/en-us/security/blog/2026/04/01/mitigating-the-axios-npm-supply-chain-compromise/>
- <https://socket.dev/blog/axios-npm-package-compromised>

