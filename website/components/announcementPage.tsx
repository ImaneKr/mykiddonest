import React, { useState, useRef, useEffect } from 'react';
import ListingAnnouncements from './listingAnnouncements';
import Image from 'next/image';
import ImagePicker from './ui/imagePicker';

const AnnouncementPage = () => {
  const [isAnnouncementPressed, setIsAnnouncementPressed] = useState(false);
  const newAnnouncementRef = useRef<HTMLDivElement>(null); // Specify the type of ref

  useEffect(() => {
    if (isAnnouncementPressed && window.innerWidth < 768) {
      newAnnouncementRef.current?.scrollIntoView({ behavior: 'smooth' }); 
    }
  }, [isAnnouncementPressed]);

  const handleAnnouncementButtonClick = () => {
    setIsAnnouncementPressed(!isAnnouncementPressed);
  };
  
  return (
    <div className='flex lg:flex-row flex-col w-full h-full gap-10 z-0'>
      <div className='flex flex-col justify-start items-start'>
        <div className={`flex w-28 border border-gray-15 justify-center items-center mt-1 pr-1 pb-1 rounded-md ml-3 focus:outline-none ${isAnnouncementPressed ? 'shadow-none bg-white opacity-50' : 'shadow-2xl   bg-blue-600 text-white'}`}>
          <button className='w-full h-full' onClick={handleAnnouncementButtonClick} disabled={isAnnouncementPressed}>
            <label className='regular-12'>+ Announcement</label>
          </button>
        </div>
        <ListingAnnouncements />
      </div>

      <div className='flex flex-col pt-10 lg:items-end items-center w-full' ref={newAnnouncementRef}>
        <div className={`flex flex-col lg:w-[80%] w-[90%] rounded-md border  shadow-xl bg-white justify-center items-start p-5 pt-3 gap-3  ${!isAnnouncementPressed ? 'border-gray-15 opacity-50' : 'border-blue-90'}`}>
          <p className='font-sans text-lg font-medium'>Create an announcement</p>
          <input type='text' className={`w-full border  rounded-md px-2 py-1 ${!isAnnouncementPressed ? 'border-gray-15' : 'border-blue-90'} group focus:border-2 focus:border-blue-90 focus:outline-none`} placeholder='Title' disabled={!isAnnouncementPressed} />
          <input type='text' className={`w-full border  rounded-md px-2 py-1 placeholder-gray-15 ${!isAnnouncementPressed ? 'border-gray-15' : 'border-blue-90'} group focus:border-2 focus:border-blue-90 focus:outline-none `} placeholder='Description' disabled={!isAnnouncementPressed} />
          <div id="newAnnouncement" className={`flex flex-col w-full border-2 border-dashed  rounded-md  ${!isAnnouncementPressed ? 'border-gray-15 ' : 'border-blue-400'}`}>
           <ImagePicker  disabled={!isAnnouncementPressed}/>
          </div>
          <div className='flex flex-row justify-between w-full mt-4'>
             <div className='flex border border-gray-15 rounded-md '><button className={`w-full h-full p-2 pl-3 pr-3 regular-12 ${!isAnnouncementPressed ? 'opacity-50 bg-gray-15' : ''}`} disabled={!isAnnouncementPressed} onClick={handleAnnouncementButtonClick}>Cancel</button></div>
             <div className='flex border border-gray-15 rounded-md '><button className={`w-full h-full p-2 pl-4 pr-4 regular-12 bg-blue-600 rounded-md text-white ${!isAnnouncementPressed ? 'opacity-50' : ''}`} disabled={!isAnnouncementPressed} onClick={handleAnnouncementButtonClick}>Submit</button></div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AnnouncementPage;
