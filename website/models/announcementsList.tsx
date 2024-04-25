import React from "react";

 export type Announcement = {
  description: string;
  title: string;
  imgPath?: string; // Make imgPath optional
};

const AnnouncementsList: Announcement[] = [
  {
    title: "Relocation",
    description: "We want to notify you that we're in the process of relocating our nursery.",
    imgPath: '/LocationChange.jpg',
  },
  {
    title: "Doctor checkup",
    description: "We inform you that your child will have a doctor checkup in our nursery next Wednesday.",
  },
];

export default AnnouncementsList;
