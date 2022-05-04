const colors = require('tailwindcss/colors')
module.exports = {
  content: ['./public/**/*.html', './src/**/*.vue', './src/main.js'],
  // presets: [],
  important: true,
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      boxShadow: {
        'dark-depth': 'inset .2rem .2rem .5rem #0b0a0f, inset -.2rem -.2rem .5rem #38344c',
        'light-depth': 'inset .2rem .2rem .5rem #b8bec7, inset -.2rem -.2rem .5rem #e2e5e9',
        'dark-level': '.3rem .3rem .6rem #0b0a0f, -.2rem -.2rem .5rem #38344c',
        'light-level': '.3rem .3rem .6rem #b8bec7, -.2rem -.2rem .5rem #e2e5e9',
      }
    },
    screens: {
      ss: '200px',
      ns: '450px',
      xs: '540px',
      sm: '640px',
      md: '768px',
      mdd: '900px',
      lg: '1024px',
      lgg: '1100px',
      xl: '1280px',
      '2xl': '1536px',
    },
    colors: {
      waruGreen: {
        primary: '#B9FABD',
        accent: '#0db16a'
      },
      metamask: '#F6851B',
      walletconnect: '#2b6cb0',
      darkShade: '#121212',
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
      emerald: colors.emerald,
      indigo: colors.indigo,
      yellow: colors.yellow,
      red: colors.red
    },
  }
}