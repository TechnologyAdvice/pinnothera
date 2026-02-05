# Changelog

## [0.2.0](https://github.com/TechnologyAdvice/pinnothera/compare/v0.1.1...v0.2.0) (2026-02-05)


### Features

* add support for fifo topics/queues ([#4](https://github.com/TechnologyAdvice/pinnothera/issues/4)) ([fcc2d08](https://github.com/TechnologyAdvice/pinnothera/commit/fcc2d08e4fb3c0872dfe9a7904f7bf57e12b5f86))


### Bug Fixes

* release ([77ad6c1](https://github.com/TechnologyAdvice/pinnothera/commit/77ad6c1cde8a6f584ee327452afe8278d27bffc9))

## [0.1.1](https://github.com/TechnologyAdvice/pinnothera/compare/v0.1.0...v0.1.1) (2024-03-28)


### Bug Fixes

* platform -&gt; platforms ([9f2a57a](https://github.com/TechnologyAdvice/pinnothera/commit/9f2a57a016935125580b34b759066feeca1c5a91))

## 0.1.0 (2024-03-28)


### Features

* Add 'force-success' flag as CLI argument ([2254fa7](https://github.com/TechnologyAdvice/pinnothera/commit/2254fa76bd594789407146392fc1880a00ad473e))
* Add 'QE' as recognized environment identifier ([1e2fb2a](https://github.com/TechnologyAdvice/pinnothera/commit/1e2fb2a2115f85c14edf338e7a6cfff71b32a8d0))
* Add `test` as a valid environment identifier ([474b14d](https://github.com/TechnologyAdvice/pinnothera/commit/474b14db70ae3684910aebd4700ebf11f47fb335))
* add access policy ([5c795e0](https://github.com/TechnologyAdvice/pinnothera/commit/5c795e0314cc3c1beb72fecd3de62dfd870ddca4))
* add build step ([53f6ef5](https://github.com/TechnologyAdvice/pinnothera/commit/53f6ef5d54199868b9ef2e4a8c1e0c6926b2ea4e))
* Fail if no access policy can be assembled and the environment is non-local ([2365e2f](https://github.com/TechnologyAdvice/pinnothera/commit/2365e2ff6270d29656cff3886ed62ea080727a02))
* Implement automatic AWS account ID resolution ([99d2b68](https://github.com/TechnologyAdvice/pinnothera/commit/99d2b6825e1d2a3db4c7deb31c8f12c5c3f14af5))
* Implement automatic AWS account ID resolution ([1c3e837](https://github.com/TechnologyAdvice/pinnothera/commit/1c3e837a65034992f57cb35a14887d560fa2e1be))
* Implement queue policy creation ([7bb9d61](https://github.com/TechnologyAdvice/pinnothera/commit/7bb9d61217ac6d613b0211452981bc79639e6ad5))
* Initial implementation of command line argument support ([2a9d4d1](https://github.com/TechnologyAdvice/pinnothera/commit/2a9d4d18c3de9eecb6af154b7f8eb7d6ea7b20b4))
* MVP implementation of command line argument support ([45c91dd](https://github.com/TechnologyAdvice/pinnothera/commit/45c91dd74ece373b389108167f6035eeba538749))
* Proper exit codes ([d1f136a](https://github.com/TechnologyAdvice/pinnothera/commit/d1f136a347b5e7f5e87deec54501978da339cce1))


### Bug Fixes

* Fix binary naming scheme ([4f3077e](https://github.com/TechnologyAdvice/pinnothera/commit/4f3077e5405975130584f3ad93323929b3e252f0))
* Fix enum variant when constructing EnvName::QE ([da3a7e5](https://github.com/TechnologyAdvice/pinnothera/commit/da3a7e5de3ef3c89b1136d1e446ff83c9915844d))
* Fix improperly interpolated policy string ([a3f2095](https://github.com/TechnologyAdvice/pinnothera/commit/a3f2095b5c78a38139af20650e7b7d5a7bf7b0ca))
* Fix queue and topic name suffixing ([651de7a](https://github.com/TechnologyAdvice/pinnothera/commit/651de7a636d48b8d6aaffb41eaba5919ca0bd0fd))
* Handle queue policy mismatch errors gracefully ([21476d2](https://github.com/TechnologyAdvice/pinnothera/commit/21476d2fdab7d2a8876211a1e0000bae13cf2af6))
* Replace array with single string in access policy ([87b130e](https://github.com/TechnologyAdvice/pinnothera/commit/87b130e3901faead8c642e54335cdece0b44fc1e))
