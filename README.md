<h1 align="center">GH Detective</h1>

<img alt="Cover" src="./ghd//Help/Assets/Cover/MD.png">

<h2 align="center">What is it?</h2>
<p align="center">
It's a ShellScript CLI App that picks-up github's links, like events, trendings, or a User's repository.
<br>
<b>The features are: Search, Explore, Trending, Trending Devs, Get User Info, Topics, Learn and Open Souce Guide.</b>
</p>

---

<br>
<h1 align="center">How to use</h1>

> Note: If you are using Git's Shell Terminal on Windows, the ghd command will be ghd.sh

## 🔎 Search
**Standard:**
```bash
$ ghd search [search]
```
> It'll returns to you informations from the [Github's Search page](https://github.com/search?).

**With Language parameter:**
```bash
$ ghd search [search] <lang>
```
+ Lang can be whatever language that you want.
> It'll returns to you informations from the [Github's Search page](https://github.com/search?) filtred by language.

**With Type parameter:**
```bash
$ ghd search [search] <type>
```
+ Type can be:
  + `--repos` | `-r`;
  + `--discussions` | `-d`;
  + `--users` | `-u`;
> It'll returns to you informations from the [Github's Search page](https://github.com/search?) filtred by type.
> 
**With Sort parameter:**
```bash
$ ghd search [search] <sort>
```
+ Sort can be:
  + `--best` | `-b`;
  + `--star` | `-s`;
  + `--forks` | `-f`;
  + `--new` | `-n`;
> It'll returns to you informations from the [Github's Search page](https://github.com/search?) sorted.

**Examples:**
```bash
$ ghd search unreal Csharp --best --r
$ ghd search unreal -b -r python
$ ghd search boot -star
$ ghd search rickb --user
$ ghd search rickb python -u 
$ ghd search design --discussions
```

---

## ✈️ Explore
**Standard:**
```bash
$ ghd
```
**Alternative:**
```bash
$ ghd explore
```
> It'll returns to you informations from the [Explore Github's page](https://github.com/explore).

---

## 👋 Devs
**Standard:**
```bash
$ ghd devs
```
**With Since parameter**
```bash
$ ghd devs <--since>
```
+ Since can be:
    + `--month` | `--monthly` | `-m`;
    + `--week` | `--weekly` | `-w`;
    + `--day` | `--daily` | `-d`;

**With Language parameter**
```bash
$ ghd devs <lang>
```
+ Lang can be whatever language that you want.

**Examples:**
```bash
$ ghd devs python --m
$ ghd devs -w cpp
```
> It'll returns to you informations from the [Trending > Developers Github's page](https://github.com/trending/developers).

---

## 🙌 Get
**Standard:**
```bash
$ ghd get [username]
```
> It'll returns to you informations from the [Github > Developer's Profie](https://github.com/RickBarretto).

**With Repository parameter**
```bash
$ ghd get [username] <--repo>
```
+ Repo can be:
  + `--repo` | `-r`
> It'll returns to you informations from the [Github > Developer's Repositories](https://github.com/RickBarretto?tab=repositories).

**Examples:**
```bash
$ ghd get rickbarretto
$ ghd get john-preston -r
```

---

## 📚 Topic
```bash
$ ghd topic [topic]
```
> It'll returns to you informations from the [Github > Topics > Topic](https://github.com/topics).

**With Sort parameter**
```bash
$ ghd topic [topic] <--sort>
```
+ Sort can be:
  + `--best` | `-b`;
  + `--star` | `-s`;
  + `--forks` | `-f`;
  + `--new` | `-n`;
> It'll returns to you informations from the [Github > Topics > Topic](https://github.com/topics) sorted.

**Examples:**
```bash
$ ghd topic 3d
$ ghd topic bash --new
```

---

## 🏫 Learn
```bash
$ ghd learn
```
> Returns all Learning content from [Github > Collections > Learn To Code](https://github.com/collections/learn-to-code)
---

## 📂 Open

After using a command that returns Github's links, you can use this command to automaticaly open, on standard browser, the last links showed.

```bash
$ ghd open [grep-array]
```
+ Grep-Array can be:
  + You must to write the link adress, or a section from this link. The program'll parse it and open.
  + You can search for multiples links, use space to separe it.
> It'll returns to you the last informations showed on terminal.

**Examples:**
```bash
$ ghd topic bash --s
$ ghd open the-art pure-bash check

$ ghd get john-preston --repos
$ ghd open desktop macho meson
```

---

## 📦 Open Souce Guide (Automaticaly Opens on Browser)

### OpenSource
```bash
$ ghd opensource
```
> Opens [Source Guidelines](https://opensource.guide/)

### Guide
```bash
$ ghd guide
```
> Opens [Source Guidelines](https://opensource.guide/)