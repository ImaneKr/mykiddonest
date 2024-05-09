import React from 'react';
import Image from 'next/image';

export type Meal = {
    name: string;
    image: string; // Assuming image is a URL
}

export type DayAndItsMeals = {
    day: string;
    meals: Meal[];
}

const MealsMenu: DayAndItsMeals[] = [
    { day: 'Sunday :', meals: [{ name: 'Spaghetti', image: '/spaghetti.jpg' },{ name: 'Orange', image: '/orange.jpg' },{ name: 'Pizza', image: '/pizza.jpg' },{ name: 'Juice', image: '/juice.jpg' } ] },
    { day: 'Monday :',meals: [{ name: 'Boiled Eggs', image: '/egg.jpg' },{ name: 'Apples', image: '/apple.jpg' }] },
    { day: 'Tuesday :',meals: [{ name: 'Pizza', image: '/pizza.jpg' },{ name: 'Juice', image: '/juice.jpg' }  ] },
    { day: 'Wednesday :' ,meals: [{ name: 'Humberger', image: '/humberger.jpg' }] },
    { day: 'Thursday :' ,meals: [{ name: 'Couscous', image: '/couscous.jpg' }] },

];

export default MealsMenu;
