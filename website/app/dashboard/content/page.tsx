// pages/page.js
'use client';
import React, { useState } from 'react';
import ContentSelect from '@/components/ContentSelect.jsx'
import Event from '@/components/eventPage';
import Announcement from '@/components/announcementPage';


const Page = () => {
  const [selectedContent, setSelectedContent] = useState('event');

  const handleSelectChange = (value:any) => {
    setSelectedContent(value);
  };

  return (
    <div className='flex flex-col w-full  justify-center items-center'>
    <div className='bg-white mt-1 h-screen  p-3 flex flex-col w-[99%] rounded-md'>
      <div className="flex flex-row justify-between">
       <h1 className='inline-block bold-32 pb-3'> Content</h1>
        {/* Use the ContentSelect component */}
        <ContentSelect onSelectChange={handleSelectChange} />
      </div>
      {/* Render component based on selected content */}
      {selectedContent === 'event' ? (
        <Event />
      ) : selectedContent === 'announcement' ? (
        <Announcement />
      ) : null}
    </div>
    </div>

  );
};

export default Page;
