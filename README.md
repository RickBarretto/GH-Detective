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

---

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

---

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

---

## 📚 Topic
```bash
$ ./web.sh topic [topic]
```
> It'll returns to you informations from the [Github > Topics > Topic](https://github.com/topics).

**With Sort parameter**
```bash
$ ./web.sh topic [topic] <--sort>
```
+ Sort can be:
  + `--best` | `-b`;
  + `--star` | `-s`;
  + `--forks` | `-f`;
  + `--new` | `-n`;
> It'll returns to you informations from the [Github > Topics > Topic](https://github.com/topics) sorted.

**Examples:**
```bash
$ ./web.sh topic 3d
$ ./web.sh topic bash --new
```

---

## 🏫 Learn
```bash
$ ./web.sh learn
```
> Returns all Learning content from [Github > Collections > Learn To Code](https://github.com/collections/learn-to-code)
---

## 📂 Open

After using a command that returns Github's links, you can use this command to automaticaly open, on standard browser, the last links showed.

```bash
$ ./web.sh open [grep-array]
```
+ Grep-Array can be:
  + You must to write the link adress, or a section from this link. The program'll parse it and open.
  + You can search for multiples links, use space to separe it.
> It'll returns to you the last informations showed on terminal.

**Examples:**
```bash
$ ./web.sh topic bash --s
$ ./web.sh open the-art pure-bash check

$ ./web.sh get john-preston --repos
$ ./web.sh open desktop macho meson
```

---

## 📦 Open Souce Guide (Automaticaly Opens on Browser)

### OpenSource
```bash
$ ./web.sh opensource
```
> Opens [Source Guidelines](https://opensource.guide/)

### Guide
```bash
$ ./web.sh guide
```
> Opens [Source Guidelines](https://opensource.guide/)