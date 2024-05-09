/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        green: {
          50: '#8BC62A',
          90: '#9BD044',
          30: '#E2FCEA',
          40: '#1DD75B',
        },
        red:{
          10: '#FFEDED',
          90: '#B30506',
        },
        gray: {
          10: '#EEEEEE',
          20: '#FAFAFB',
          30: '#7B7B7B',
          50: '#585858',
          90: '#141414',
          40: 'F4F4F4',
          15: '#B0B3B9',
          99: '#424D60',
        },
        orange: {
          10:'#D9D9D9',
          15:'#FFF8E8',
          20:'#F1E4B6',
          30:'#FCE7A0',
          40:'#F4D877',
          50:'#F4D877',
          70:'#FF814C',
          90:'#FFF2D5',
        },
        blue: {
          70: '#021639',
          40: '#E4F4FF',
          90: '#379AE6',
          50: '#67C9FA',
        },
        yellow: {
          50: '#FEC601',
          40: '#FFD233',
        },
      },
      backgroundImage: {
        'bg-img-1': "url('/bg-large.png')",
        'bg-img-2': "url('/bg-large-kid.png')",
        'green-1': "url('/bg-green-1.jpg')",
        'green-2': "url('/bg-green-2.jpg')",
        'feature-bg': "url('/feature-bg.png')",
        'login':"url('/login.jpg')",
        pattern: "url('/pattern.png')",
        'pattern-2': "url('/pattern-bg.png')",
        'orange-cloud': "url('/cloud-yellow.jpg')",
        'gradient-to-br':'linear-gradient(to bottom right,#F8EDC7,#F1E4B6,#FCE7A0,#F4D877,#F4D877)',
        'bgbg':"url('/bgbg.png')",
      },
      screens: {
        xs: '400px',
        '3xl': '1680px',
        '4xl': '2200px',
      },
      maxWidth: {
        '10xl': '1512px',
      },
      borderRadius: {
        '5xl': '40px',
      },
      
    },
  },
  plugins: [],
};