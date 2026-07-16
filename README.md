# BCH Forge Website

Source for the [BCH Forge](https://bchforge.org) website.

BCH Forge builds practical, auditable open-source tools for Bitcoin Cash
self-custody and infrastructure. The website is intentionally minimal: plain
HTML and CSS, with no framework or build step.

## Local Preview

Use the live development server:

```bash
npm run dev
```

Then open:

```text
http://127.0.0.1:8000
```

The browser reloads automatically when files change.

Other local development commands:

```bash
npm run status
npm run stop
```

`npm run dev` does not kill existing processes. If the configured port is busy,
it exits and asks you to choose another port. `npm run stop` only sends a signal
to the exact PID written by `npm run dev`.

The default server configuration is:

```text
HOST=0.0.0.0
PORT=8000
LOG_FILE=/tmp/bchforge-org-browser-sync.log
PID_FILE=/tmp/bchforge-org-live-server.pid
```

You can override `HOST`, `PORT`, `LOG_FILE`, or `PID_FILE` when needed:

```bash
PORT=8080 npm run dev
```

## Structure

| Path | Purpose |
|---|---|
| `index.html` | Website content and metadata. |
| `styles.css` | Website styles. |
| `assets/` | Brand and social-media assets. |
| `CNAME` | Custom domain for the published site. |
| `scripts/` | Local preview helpers. |

## License

This project is licensed under the [MIT License](LICENSE).
