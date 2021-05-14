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
> It'll returns to you informations from the [Explore Github's page](https://github.com/explore).



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
> It'll returns to you informations from the [Trending > Developers Github's page](https://github.com/trending/developers).



## 🙌 Get
**Standard:**
```bash
$ ./web.sh get [username]
```
> It'll returns to you informations from the [Github > Developer's Profie](https://github.com/RickBarretto).

**With Repository parameter**
```bash
$ ./web.sh get [username] <--repo>
```
+ Repo can be:
  + `--repo` | `-r`
> It'll returns to you informations from the [Github > Developer's Repositories](https://github.com/RickBarretto?tab=repositories).

**Examples:**
```bash
$ ./web.sh get rickbarretto
$ ./web.sh get john-preston -r
```


### Help
### Learn