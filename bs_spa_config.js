const ASSET_EXTENSIONS = [
    'js',
    'css',
    'png',
    'jpe?g',
    'gif',
    'svg',
    'eot',
    'otf',
    'ttc',
    'ttf',
    'woff2?'
]
const DEFAULT_FILE = 'index.html';
const ASSET_EXTENSION_REGEX = new RegExp(`\\b(?!\\?)\\.(${ASSET_EXTENSIONS.join('|')})\\b(?!\\.)`, 'i');

module.exports = {
    server: {
        baseDir: 'build/www'
    },
    // reloads after hashes are replaced in html file
    // prevents premature reloads
    files: 'build/www/' + DEFAULT_FILE,
    middleware: function(req, res, next) {


        // if not an asset, set the url to the default url
        if (!ASSET_EXTENSION_REGEX.test(req.url)) {
            // currently only routes to default file.
            // in the future we can modify this to look for multiple files
            //
            // possibly:
            // if (path == actual file)
            //     {return file}
            //    else { 
            //        scan up the tree until finding an appropriate html file
            //      }
            //
            req.url = '/' + DEFAULT_FILE;
        }

        return next();
    }
};
