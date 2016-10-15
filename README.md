# java8 Puppet Module

[![Build Status](https://travis-ci.org/Spantree/puppet-java8.svg?branch=master)](https://travis-ci.org/Spantree/puppet-java8)
[![Puppet Forge](https://img.shields.io/puppetforge/v/spantree/java8.svg)](https://forge.puppetlabs.com/spantree/java8)
[![Puppet Forge](https://img.shields.io/puppetforge/f/spantree/java8.svg)](https://forge.puppetlabs.com/spantree/java8)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with java8](#setup)
    * [What java8 affects](#what-java8-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with java8](#beginning-with-java8)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The module java8 installs the oracle java8 jdk on Ubuntu or Debian based system.

## Module Description

This module adds a apt repository and then proceeds to install oracle jdk8

##### NOTE: This module may only be used if you agree to the Oracle license: http://www.oracle.com/technetwork/java/javase/terms/license/

## Setup

### What java8 affects

* Install oracle jdk using the 'https://launchpad.net/~webupd8team/+archive/ubuntu/java' deb package
* Sets up a system wide `JAVA_HOME`

### Setup Requirements

None at the moment.

### Beginning with java8

`include java8` is enough to get you up and running.

##Usage

All interaction with the java8 module can be done through the main java8 class.

###I just want Oracle java 8 jdk, what's the minimum I need?
```puppet
include java8
```

##Reference

###Classes

####Public Classes

* java8: Main class

###Parameters

###Facts

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* Ubuntu 12.04
* Ubuntu 14.04

Testing on other platforms has been light and cannot be guaranteed.

## Development

## Release Notes/Contributors/Etc
Thanks [arpitaggarwal](https://github.com/arpitaggarwal), [PHDA](https://github.com/PHDA) and [Conzar](https://github.com/Conzar) for their contributions.

