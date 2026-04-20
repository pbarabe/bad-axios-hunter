# Bad-Axios Hunter #

## About ##

Searches for projects with dependencies that may have been compromised by malicious [axios / plain-crypto-js](https://content.govdelivery.com/accounts/USDHSCISA/bulletins/413c7a5).

Recursively finds package lock files and `grep`s for `axios` and `plain-crypto-js` the named directory and subdirectories.


## Prerequites ##

- `bash`


## Usage ##

```sh
# Scan a named directory
bad-axios.sh <directory>

# Test scan on files in the ./test/ folder
bad-axios.sh -t
```


## Modification log ##

20 April 2025
- Forked and streamlined as 'bad-axios-hunter'

24 Sep 2025
- Refine logic to evaluate only package-lock.json, yarn.lock, and pnpm-lock.yaml files  
- Replace affected-packages.json contents with more up-to-date list grabbed from https://socket.dev/

23 Sep 2025
- Initial creation as [shai-hlud-hunter](https://github.com/pbarabe/shaihulud-hunter)


## Additional Resources ##

- <https://github.com/axios/axios/issues/10636>
- <https://www.microsoft.com/en-us/security/blog/2026/04/01/mitigating-the-axios-npm-supply-chain-compromise/>
- <https://socket.dev/blog/axios-npm-package-compromised>

