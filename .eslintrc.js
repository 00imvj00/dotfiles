module.exports = {
	env: {
		browser: true,
		commonjs: true,
		es2021: true,
	},
	plugins: ['prettier'],
	extends: ['eslint:recommended', 'google', 'prettier'],
	parserOptions: {
		ecmaVersion: 2020,
	},
	rules: {},
}
