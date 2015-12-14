module.exports = {
    handlebars: {
        templates: require('path').join(__dirname, './templates'),
        partials: require('path').join(__dirname, './partials')
    },
    less: {
        main: [
            require.resolve('./less/theme.less'),
            require.resolve('./less/variables.less')
        ]
    }
};
