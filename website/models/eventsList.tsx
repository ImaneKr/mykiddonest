  import React from 'react';

  export type Event = {
    date: Date;
    title: string;
    imgPath?: string; // Make imgPath optional
  };

  let eventsList: Event[] = [
    {
      title: "Ali's birthday party",
      date: new Date('2024-04-05'),
      imgPath: '/birthday.jpeg', // Corrected imgPath
    },
    {
      title: "Trip to the animal Zoo",
      date: new Date('2024-04-06'),
    },
    {
      title: "Celebrating Eid",
      date: new Date('2024-04-07'),
    },
  ];

  export const addEvent = (event: Event) => {
    eventsList = [...eventsList, event];
  };

  export default eventsList;
