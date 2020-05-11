<p align="center">
  <h1 align="center">SPECULA</h1>
  <p align="center">
    <a href="https://github.com/LuxAter/Lexici/graphs/contributors"><img src="https://img.shields.io/github/contributors/LuxAter/Lexici.svg?style=flat-square"></a>
    <a href="https://github.com/LuxAter/Lexici/network/members"><img src="https://img.shields.io/github/forks/LuxAter/Lexici.svg?style=flat-square"></a>
    <a href="https://github.com/LuxAter/Lexici/stargazers"><img src="https://img.shields.io/github/stars/LuxAter/Lexici.svg?style=flat-square"></a>
    <a href="https://github.com/LuxAter/Lexici/issues"><img src="https://img.shields.io/github/issues/LuxAter/Lexici.svg?style=flat-square"></a>
    <a href="https://github.com/LuxAter/Lexici/blob/master/LICENSE.txt"><img src="https://img.shields.io/github/license/LuxAter/Lexici.svg?style=flat-square"></a>
    <a href="https://github.com/LuxAter/Lexici/releases"><img src="https://img.shields.io/github/tag/LuxAter/Lexici.svg?include_prereleases&sort=semver&style=flat-square"></a>
    <br/>
    Programming Language Lexicon
    <br/>
    <a href="https://luxater.github.io/Lexici"><strong>Documentation</strong></a>
    <br/>
    <br/>
    <a href="https://github.com/LuxAter/Lexici/releases">Downloads</a>
    ·
    <a href="https://github.com/LuxAter/Lexici/issues/new?template=bug_report.md">Report Bug</a>
    ·
    <a href="https://github.com/LuxAter/Lexici/issues/new?template=feature_request.md">Request Feature</a>
  </p>
</P>

## About the Project

This project is a collection of different programming languages, implementing
the same set of problems. The problems are taken from Project Euler. This tool
can be used for reference for a number of different programming languages, as
each implementation of a problem uses the same algorithm, so the similarities
between languages can be directly compared.

Although it is not a good metric, it can also generally be used to compare the
performance of different programming languages, along with the syntax complexity
of the languages. All of these features are controlled in the `Lexici` script,
see the help for more information.

## Getting Started

These instructions will get you a copy of the collection up and running on your
local machine for development and testing purposes.

### Prerequisites

To run all the languages, a number of dependences are required. If a
dependency is not found, errors will occurs, but the  script should fail
gracefully and execution will continue for the other languages. Specifically the
dependencies are

* `gnatmake`
* `bash`
* `clang`
* `clang++`
* `mcs`
* `go build`
* `node`
* `clisp` 
* `perl`
* `python3`
* `Rscript`
* `ruby`
* `rustc`

### Clone

The recommended method to get the code is to clone it from the git repository.

```fish
git clone https://github.com/LuxAter/Lexici.git
```

## Usage

The collection is shipped with a script that compiles, runs, and analyzes all of
the targets.

```bash
./lexici         # Compile and run all targets
./Lexici -ctr    # Clean, then rebuild and run all targets
./Lexici -r cpp  # Run C++ targets if they have been built
```

## Contributing

Contributions are what make the open source community such an amazing place to
be, learn, inspire, and create. Any contributions you make are **greatly
appreciated**.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/<my-feature>`)
3. Commit your changes (`git commit -m '<my-commit-message>'`)
4. Push to the branch (`git push origin feature/<my-feature>`)
5. Open a pull request

## License

Distributed under the GNU GP Lvi license. See
[`LICENSE.md`](https://github.com/LuxAter/Lexici/blob/development/LICENSE.txt)
for more information.
