const path = require('path')
const rails = require('esbuild-rails')

const stubNodeModule = {
  name: 'stub-node-module',
  setup(build) {
    build.onResolve({ filter: /^module$/ }, () => ({
      path: 'module',
      namespace: 'stub-node-module',
    }))
    build.onLoad({ filter: /.*/, namespace: 'stub-node-module' }, () => ({
      contents: 'export function createRequire() { return function() { throw new Error("require() is not available in the browser bundle"); } }',
      loader: 'js',
    }))
  },
}

require("esbuild").build({
  entryPoints: ["application.js"],
  bundle: true,
  sourcemap: true,
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  watch: process.argv.includes("--watch"),
  define: {
    "process.env.NODE_ENV": JSON.stringify(process.env.NODE_ENV || "development"),
  },
  plugins: [rails(), stubNodeModule],
}).catch(() => process.exit(1))
