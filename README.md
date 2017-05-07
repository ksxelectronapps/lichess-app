# lichess-app
A desktop client for lichess.org

## Feature

* Bring you to [lichess.org](https://lichess.org)

## To Do

- [ ] Lichess icon
- [ ] Tray icon
- [ ] Customize menu bar
- [ ] Handle notifications
- [ ] Upload to AUR

## Development

### Requirements

* NodeJS ≥ 6.0.0, and npm (mandatory)
* BASH environment (mandatory)
* UNIX-like environment (optional, recommend)

### Preparation

```bash
npm install
```

### Test and build

#### Quick checking

Check code style and small stuffs

```bash
npm test
```

#### Start application

Open application window and interact with it

```bash
npm start
```

#### Dist without packaging

Create application directories without packaging

```bash
OPTIONS='linux macos windows' npm run dist # If success, open 'dist' folder to see the result
```

#### Create packages

Create distributable packages (files)

```bash
OPTIONS='linux macos windows' npm run pack # If success, open 'dist' folder to see the result
```

#### Clean the mess

Remove all "gitignored" files/folders (dist, \*.tmp, \*.log, etc.)

```bash
npm run clean
```

## Download

Go to [GitHub Release page](https://git.io/v9wH6)

## License

[MIT](./LICENSE.md)
