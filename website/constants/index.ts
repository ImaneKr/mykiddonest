import { features, title } from "process";

// NAVIGATION
export const NAV_LINKS = [
    { href: '/', key: 'home', label: 'Home' },
    { href: '/#features', key: 'services', label: 'Features' },
    { href: '/#pricing', key: 'pricing ', label: 'Pricing ' },
    { href: '/#about_us', key: 'About_us', label: 'About Us' },
  ];
  export const SIDE_NAV_LINKS = [
    { href: '/', key: 'home', label: 'Home' },
    { href: '/', key: 'tables', label: 'Time tables' },
    { href: '/', key: 'calander ', label: 'Events Calandar' },
    { href: '/', key: 'teams', label: 'Team manage' },
    { href: '/', key: 'parants', label: 'Parents Accounts' },
    { href: '/', key: 'children ', label: 'Childrens Profile ' },
    { href: '/', key: 'settings', label: 'Settings' },
    { href: '/', key: 'content', label: 'Content' },

  ];  
  // CAMP SECTION

  
  export const PEOPLE_URL = [
    '/person-1.png',
    '/person-2.png',
    '/person-3.png',
    '/person-4.png',
  ];
  
  // FEATURES SECTION
  export const FEATURES = [
    {
      title: 'Seamless Child Profile Management',
      icon: '/icons/manage-accounts.svg',
      variant:'bg-blue-90',
      description:
        'Create and manage your child’s profile with ease. Our intuitive form allows you to add all the necessary details, and with administrative approval, your child’s journey begins.',
    },
    {
      title: 'Stay Updated With Events',
      icon: '/icons/uil--calender.svg',
      variant: 'bg-yellow-40',
      description:
        "Never miss an important date again! Our app keeps you in the loop with all nursery events. With a simple tap, you can accept or decline invitations, ensuring you're always part of your child's important moments.",
    },
    {
      title: 'Insightful Observations',
      icon: '/icons/ph--books-light.svg',
      variant: 'bg-yellow-40',
      description:
        " Dive into your child's progress with updates from their teacher. Our app provides a window into your child's development, offering valuable insights and observations that bring you closer to their educational journey.",
    },
    {
      title: 'Hassle-Free Payments',
      icon: '/icons/credit-cards.svg',
      variant: 'bg-blue-90',
      description:
        "Say goodbye to payment woes with our secure online payment system. Pay your child's monthly subscription with confidence and convenience, right from your phone.",
    },
  ];
  //pricing options
  export const PRICING_OPTIONS=[
    {
      title:'Basic',
      price:'4500.00DA',
      variant:'bg-green-90',
      description:'Our basic plan is the perfect entry point for those who registered their children for the first time.',
      features: ['feature1','feature2',' feature3'],
    },
    {
      title:'Advanced',
      variant:'bg-blue-90',
      price:'5000.00DA',
      description:'Our Advanced plan is pinnacle of our offerings, curated for those who wants the excllence service',
      features: ['feature1',' feature2'],
    },
  ]
  // FOOTER SECTION
  export const FOOTER_LINKS = [
    {
      title: 'Learn More',
      links: [
        'About MyKiddoNest',
        'Environment',
        'Jobs',
        'Privacy Policy',
        'Contact Us',
      ],
    },
  
  ];
  
  export const FOOTER_CONTACT_INFO = {
    title: 'Contact Us',
    links: [
      { label: 'Admin Officer', value: '123-456-7890' },
      { label: 'Email Officer', value: 'mykiddonest@gmail.com' },
    ],
  };
  
  export const SOCIALS = {
    title: 'Social',
    links: [
      '/icons/facebook.svg',
      '/icons/instagram.svg',
      '/icons/linkdin.svg',
      '/icons/twitter.svg',
    ],
  };