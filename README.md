<br/>

<h1 align="center"> <img src="./assets/gifs/typingcat.gif" width="30"> configuration </h1>

<p align="center">
	<a href="https://tafaranyamhunga.com" target="_blank">
		<img width="60%" src="./assets/images/Configuration.png" alt="Configuration image">
	</a>
</p>

<p align="center">
	<samp>
		<a href="https://tafaranyamhunga.com" target="_blank">
			<img src="https://img.shields.io/badge/Tafara's-website-orange?style=flat-square&labelColor=000000&color=FF5100" alt="GitHub MIT license">
		</a>
		<a href="https://github.com/tafaranyamhunga" target="_blank">
			<img src="https://img.shields.io/badge/GitHub-Owner-orange?style=flat-square&labelColor=000000&color=FF5100&logo=github" alt="GitHub MIT license">
		</a>
		<a href="LICENSE" target="_blank">
			<img src="https://img.shields.io/badge/LICENSE-MIT-orange?style=flat-square&labelColor=000000&color=green&" alt="GitHub MIT license">
		</a>
		<a href="" target="_blank">
			<img src="https://img.shields.io/badge/macOS-OS-orange?style=flat-square&labelColor=000000&color=FF5100&logo=apple" alt="macOS">
		</a>
		<a href="" target="_blank">
			<img src="https://img.shields.io/badge/Linux-OS-orange?style=flat-square&labelColor=000000&color=FF5100&logo=linux" alt="Linux OS: Ubuntu">
		</a>
	</samp>
</p>

<p align="center"> <i> Personal system configuration repository for <b> macOS </b> and <b> Linux </b> machines.</i> </p>

<p align="center">
	<samp>
		<a href="#about" target="_blank"> About </a> •
		<a href="#supported-platforms" target="_blank"> Supported Platforms </a> •
		<a href="#installation" target="_blank"> Installation </a> •
		<a href="#usage" target="_blank"> Usage </a> •
		<a href="#usage" target="_blank"> Repository Structure </a> •
		<a href="#safety-and-assumptions" target="_blank"> Safety And Assumptions </a>
	</samp>
</p>

---

## About

This repository contains scripts, dotfiles, and documentation used to:
- Set up new computers from scratch
- Rebuild a system after failure or replacement
- Maintain a consistent development environment across machines
- Serve as a centralized backup of system preferences and tools
- Automated installation of GUI and CLI applications
- Centralized management of dotfiles
- OS-specific configuration (macOS and Linux)
- Font management
- Shell, Git, and editor configuration
- Idempotent scripts (safe to re-run)

> _The repository contains two sub directories for specific scripts and settings for macOS and Ubuntu_

## Supported Platforms

- macOS (MacBook)
- Linux
  - Ubuntu and most Debian based distros
  - RHEL, Arch (_planned/optional_)

## Installation

```bash
git clone git@github.com:tafaranyamhunga/configuration.git
```

## Usage

The usage and settings are split into two:

### 1. macOS

```bash
git clone git@github.com:tafaranyamhunga/configuration.git
cd configuration/macbook

./install.sh
./post_install.sh
```

### 2. Linux: Ubuntu

```bash
git clone git@github.com:tafaranyamhunga/configuration.git
cd configuration/linux

./install.sh
./post_install.sh
```

## Repository Structure

| Path                                                                                         | Description                                                |
| -------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| [assets](./macbook)                                                                          | Project assets                                             |
| [macbook/](./macbook)                                                                        | macOS specific setup scripts and dotfiles                  |
| [linux/](./linux)                                                                            | Ubuntu specific setup scripts and dotfiles                 |
| [docs/](./docs/README.md)                                                                    | Tool documentation, philosophy, and troubleshooting        |

## Safety And Assumptions

- _Scripts are designed for **personal use**_
- _Some scripts may overwrite existing dotfiles_
- _Review scripts before running on production systems_
