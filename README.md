# GHBAsh

## What is it?

This app captures the Github's trending. 

<br>

---

<br>
<br>

# How to use

## ✈️ Explore
**Standard:**
```bash
$ ./web.sh
```
**Alternative:**
```bash
$ ./web.sh explore
```
> It will returns to you informations from the [Explore Github's page](https://github.com/explore).

## 👋 Devs
**Standard:**
```bash
$ ./web.sh devs
```
**With Since parameter**
```bash
$ ./web.sh devs <--since>
```
+ Since can be:
    + `--month` | `--monthly` | `-m`;
    + `--week` | `--weekly` | `-w`;
    + `--day` | `--daily` | `-d`;

**With Language parameter**
```bash
$ ./web.sh devs <lang>
```
+ Lang can be whatever language that you want.

**Examples:**
```bash
$ ./web.sh devs python --m
$ ./web.sh devs -w cpp
```

### Help
### Devs
### Learn